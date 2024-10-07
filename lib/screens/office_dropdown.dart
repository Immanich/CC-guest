import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:connectivity_plus/connectivity_plus.dart';
import '../database/database.dart'; // Your SQLite service

class OfficeDropdown extends StatefulWidget {
  final Function(String) onChanged;
  final Key? key;

  OfficeDropdown({required this.onChanged, this.key}) : super(key: key);

  @override
  OfficeDropdownState createState() => OfficeDropdownState();
}

class OfficeDropdownState extends State<OfficeDropdown> {
  String? selectedOffice;
  final storage = const FlutterSecureStorage();

  List<DropdownMenuItem<String>> officeItems = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    loadOffices();
  }

  Future<void> loadOffices() async {
    // Check for internet connection
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // Device is online, sync from server and update SQLite
      await fetchAndSyncOfficesFromServer();
    } else {
      // Device is offline, load offices from SQLite
      await loadOfficesFromSQLite();
    }
  }

  Future<void> fetchAndSyncOfficesFromServer() async {
    try {
      final token = await storage.read(key: 'auth');
      Dio.Response res = await Dio.Dio().get(
        'https://your-laravel-backend-url.com/api/user/offices',
        options: Dio.Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      List<dynamic> offices = res.data;

      // Update SQLite database with the latest data
      await DatabaseService().clearOffices();
      await DatabaseService().insertOffices(
        offices
            .map((office) => {
                  'id': office['id'],
                  'office_name': office['office_name'],
                  'description': office['description'],
                  // 'phone': office['phone']
                })
            .toList(),
      );

      setState(() {
        officeItems = offices.map<DropdownMenuItem<String>>((office) {
          return DropdownMenuItem<String>(
            value: office['id'].toString(),
            child: Text(office['office_name']),
          );
        }).toList();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = 'Failed to load offices from server';
        isLoading = false;
      });
    }
  }

  Future<void> loadOfficesFromSQLite() async {
    try {
      List<Map<String, dynamic>> localOffices =
          await DatabaseService().getOffices();

      setState(() {
        officeItems = localOffices.map<DropdownMenuItem<String>>((office) {
          return DropdownMenuItem<String>(
            value: office['id'].toString(),
            child: Text(office['office_name']),
          );
        }).toList();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = 'Failed to load offices from local storage';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (errorMessage.isNotEmpty) {
      return Center(child: Text(errorMessage));
    }

    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: selectedOffice != null
                ? 'SELECTED OFFICE: $selectedOffice'
                : 'WHAT OFFICE?',
          ),
          value: selectedOffice,
          items: officeItems.isNotEmpty
              ? officeItems
              : [
                  DropdownMenuItem(
                      value: 'default', child: Text('No offices available'))
                ],
          onChanged: (value) {
            setState(() {
              selectedOffice = value;
            });
            widget.onChanged(value ?? '');
          },
        ),
      ],
    );
  }

  void resetOffice() {
    setState(() {
      selectedOffice = null;
    });
  }
}
