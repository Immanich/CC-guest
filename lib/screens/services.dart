import 'package:flutter/material.dart';
import '../network_utils/api.dart';
import '../models/office.dart';
import '../models/service.dart';
// import 'service_details.dart'; // Assuming you're navigating to a ServiceDetails page

class Services extends StatefulWidget {
  final Office office;

  Services({required this.office});

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  late Future<List<Service>> _servicesFuture;

  @override
  void initState() {
    super.initState();
    _servicesFuture = ApiService().fetchServicesForOffice(widget.office.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Service>>(
      future: _servicesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No services available'));
        }

        final services = snapshot.data!;
        return ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            var service = services[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ServicesInfoScreen(service, widget.office),
                  ),
                );
              },
              child: Card(
                elevation: 4, // Add elevation for shadow effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                margin: EdgeInsets.all(10), // Margin around each ListTile
                color: const Color(0xFFCCD8FE), // Light blue background color
                child: Padding(
                  padding: const EdgeInsets.all(10), // Padding inside the card
                  child: ListTile(
                    title: Text(
                      service.service_name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      service.description,
                      style: TextStyle(color: Colors.black87), // Subtitle style
                      textAlign: TextAlign.justify,
                      maxLines: null, // Allow text to wrap to multiple lines
                      overflow: TextOverflow.visible, // Show the entire text
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ServicesInfoScreen extends StatelessWidget {
  final Service service;
  final Office office;

  ServicesInfoScreen(this.service, this.office);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(office.office_name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(service.service_name,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
              Container(
                child: Text(
                  service.description,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 20),
              Table(
                border:
                    TableBorder.all(color: Colors.grey), // Add table borders
                columnWidths: {
                  0: FlexColumnWidth(2), // Adjust column width (flex ratio)
                  1: FlexColumnWidth(3),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Office or Division:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          office.office_name,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Classification:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(service.classification),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Type of Transaction',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Column 2 Row 3'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Table(
                border:
                    TableBorder.all(color: Colors.grey), // Add table borders
                columnWidths: {
                  0: FlexColumnWidth(3), // Adjust column width (flex ratio)
                  1: FlexColumnWidth(3),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('CHECKLIST OF REQUIREMENTS',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'WHERE TO SECURE',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...service.checklistOfRequirements
                                .map((requirement) => Text('- $requirement'))
                                .toList(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(service.whereToSecure),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Table(
                border:
                    TableBorder.all(color: Colors.grey), // Add table borders
                columnWidths: {
                  0: FlexColumnWidth(1), // Adjust column width (flex ratio)
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('CLIENTS',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'AGENCY ACTION',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'FEES TO BE PAID',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'PROCESSING TIME',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'PERSON RESPONSIBLE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("servicesInfo.clients",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'AGENCY ACTION',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'FEES TO BE PAID',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'PROCESSING TIME',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'PERSON RESPONSIBLE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
