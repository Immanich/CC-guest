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

import 'package:citizen_charter/models/service.dart';
import 'package:citizen_charter/models/services_info.dart';
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
  Map<int, List<Service>> servicesMap = {};
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchOfficesAndServices();
  }

  // Function to fetch offices using ApiService
  Future<void> fetchOfficesAndServices() async {
    try {
      List<dynamic> officeData = await ApiService().fetchOfficesFromServer();
      List<Office> fetchedOffices =
          officeData.map((data) => Office.fromJson(data)).toList();

      Map<int, List<Service>> tempServicesMap = {};
      for (var office in fetchedOffices) {
        List<Service> services =
            await ApiService().fetchServicesForOffice(office.id);
        tempServicesMap[office.id] = services;
      }

      setState(() {
        offices = fetchedOffices;
        servicesMap = tempServicesMap;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage =
            'Failed to load offices and services: ${error.toString()}';
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
                  child: CircularProgressIndicator(),
                );
              }

              if (errorMessage.isNotEmpty) {
                return Center(
                  child: Text(errorMessage),
                );
              }

              if (offices.isEmpty) {
                return Center(
                  child: Text('No offices available'),
                );
              }

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      ListView.builder(
                        shrinkWrap: true,
                        physics:
                            NeverScrollableScrollPhysics(), // Prevent inner scroll
                        itemCount: offices.length,
                        itemBuilder: (BuildContext context, int index) {
                          var office = offices[index];

                          // Get services for the current office
                          var services = servicesMap[office.id] ?? [];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Text(
                                  office.office_name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: services.length,
                                itemBuilder:
                                    (BuildContext context, int serviceIndex) {
                                  var service = services[serviceIndex];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ServicesInfoScreen(
                                            service,
                                            office,
                                            service.servicesInfos,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      elevation:
                                          4, // Add elevation for shadow effect
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            15), // Rounded corners
                                      ),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      color: const Color(
                                          0xFFCCD8FE), // Light blue background color
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            10), // Padding inside the card
                                        child: ListTile(
                                          title: Text(
                                            service.service_name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ),
                                          subtitle: Text(
                                            service.description,
                                            style: TextStyle(
                                                color: Colors
                                                    .black87), // Subtitle style
                                            textAlign: TextAlign.justify,
                                            maxLines:
                                                null, // Allow text to wrap to multiple lines
                                            overflow: TextOverflow
                                                .visible, // Show the entire text
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
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
