// import 'package:citizen_charter/screens/accounting_services.dart';
// import 'package:citizen_charter/screens/menu_btn.dart';
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         top: true,
//         child: DefaultTextStyle(
//           style: Theme.of(context).textTheme.bodyMedium!,
//           child: LayoutBuilder(
//             builder:
//                 (BuildContext context, BoxConstraints viewportConstraints) {
//               return SingleChildScrollView(
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(
//                     minHeight: viewportConstraints.maxHeight,
//                   ),
//                   child: Column(
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           // MenuBtn(),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => AccountingServices()),
//                               );
//                             },
//                             child: Column(
//                               children: <Widget>[
//                                 Container(
//                                   width: 150,
//                                   height: 150,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffCCD8FE),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(5)),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/icons/accounting_icon.png',
//                                     width: 60,
//                                     // fit: BoxFit.contain,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   "Accounting Office",
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               // Add your code here to handle the tap event
//                               // Navigator.pushNamed(context, '/events');
//                               // print('Assessor\'s Office icon tapped');
//                             },
//                             child: Column(
//                               children: <Widget>[
//                                 Container(
//                                   width: 150,
//                                   height: 150,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffCCD8FE),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(5)),
//                                   ),
//                                   child: Image.asset(
//                                     'assets/images/icons/assessors_icon.png',
//                                     width: 60,
//                                     // fit: BoxFit.contain,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   "Assessor's Office",
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   void _scrollToAccounting() {
//     _scrollController.animateTo(
//       _scrollController.position.maxScrollExtent,
//       duration: Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//   }
// }

import 'package:citizen_charter/models/transaction.dart';
import 'package:citizen_charter/screens/services.dart';
import 'package:flutter/material.dart';
import 'package:citizen_charter/models/office.dart'; // Import your Offices model
import 'package:citizen_charter/network_utils/api.dart'; // Import your ApiService
// import '../models/offices.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Office> offices = []; // To store the fetched offices as Offices objects
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchOffices();
  }

  // Function to fetch offices using ApiService
  Future<void> fetchOffices() async {
    try {
      List<dynamic> officeData = await ApiService()
          .fetchOfficesFromServer(); // Use ApiService to fetch offices
      setState(() {
        offices = officeData
            .map((data) => Office.fromJson(data))
            .toList(); // Convert raw JSON to Offices objects
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = 'Failed to load offices: ${error.toString()}';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyMedium!,
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              if (isLoading) {
                return Center(
                  child: CircularProgressIndicator(), // Show loading spinner
                );
              }

              if (errorMessage.isNotEmpty) {
                return Center(
                  child: Text(
                      errorMessage), // Show error message if fetching fails
                );
              }

              if (offices.isEmpty) {
                return Center(
                  child: Text(
                      'No offices available'), // Show if no offices are found
                );
              }

              // Dynamically displaying offices using a GridView
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(), // Allow scrolling
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // childAspectRatio: 0.9, //if using pixel 6 emulator
                          // use the serve below if using a physical android device
                          // php artisan serve --host=0.0.0.0 --port=8000
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: offices
                            .length, // Number of items based on fetched offices
                        itemBuilder: (BuildContext context, int index) {
                          var office = offices[
                              index]; // Get each office as an Offices object
                          return GestureDetector(
                            onTap: () {
                              // Handle tap event (e.g., navigate to details)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OfficeDetailsScreen(
                                    office: office,
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xffCCD8FE),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Icon(
                                    Icons.business, // Icon placeholder
                                    size: 60,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  office
                                      .office_name, // Display office name using the model
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class OfficeDetailsScreen extends StatelessWidget {
  final Office office;

  OfficeDetailsScreen({required this.office});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(office.office_name),
      ),
      body: Center(
        child: Services(office: office),
      ),
    );
  }
}
