import 'package:citizen_charter/models/services_info.dart';
import 'package:flutter/material.dart';
import '../network_utils/api.dart';
import '../models/office.dart';
import '../models/service.dart';
// import 'service_details.dart'; // Assuming you're navigating to a ServiceDetails page

// class Services extends StatefulWidget {
//   final Office office;
//   final List<Service> services;
//   // final List<ServiceInfo> servicesInfo;

//   Services({
//     required this.office,
//     required this.services,
//     // required this.servicesInfo
//   });

//   @override
//   _ServicesState createState() => _ServicesState();
// }

// class _ServicesState extends State<Services> {
//   late Future<List<Service>> _servicesFuture;

//   @override
//   void initState() {
//     super.initState();
//     _servicesFuture = ApiService().fetchServicesForOffice(widget.office.id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Service>>(
//       future: _servicesFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(child: Text('No services available'));
//         }

//         final services = snapshot.data!;
//         return ListView.builder(
//           itemCount: services.length,
//           itemBuilder: (context, index) {
//             var service = services[index];
//             return InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ServicesInfoScreen(
//                         service, widget.office, service.servicesInfos
//                         // widget.servicesInfo
//                         ),
//                   ),
//                 );
//               },
//               child: Card(
//                 elevation: 4, // Add elevation for shadow effect
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15), // Rounded corners
//                 ),
//                 margin: EdgeInsets.all(10), // Margin around each ListTile
//                 color: const Color(0xFFCCD8FE), // Light blue background color
//                 child: Padding(
//                   padding: const EdgeInsets.all(10), // Padding inside the card
//                   child: ListTile(
//                     title: Text(
//                       service.service_name,
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                       textAlign: TextAlign.center,
//                     ),
//                     subtitle: Text(
//                       service.description,
//                       style: TextStyle(color: Colors.black87), // Subtitle style
//                       textAlign: TextAlign.justify,
//                       maxLines: null, // Allow text to wrap to multiple lines
//                       overflow: TextOverflow.visible, // Show the entire text
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

class ServicesInfoScreen extends StatelessWidget {
  final Office office;
  final Service service;
  final List<ServiceInfo> servicesInfo;

  ServicesInfoScreen(this.service, this.office, this.servicesInfo);

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
                        child: Text(service.typeOfTransaction),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              // for (var service in service)
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
                  for (int i = 0; i < _getMaxLengthChecklist(service); i++)
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              _getValue(service.checklistOfRequirements, i),
                              style: TextStyle(fontSize: 12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_getValue(service.whereToSecure, i),
                              style: TextStyle(fontSize: 12)),
                        ),
                      ],
                    ),
                ],
              ),
              SizedBox(height: 10),
              for (var serviceInfo in servicesInfo
                  .where((info) => info.serviceId == service.id)) ...[
                Table(
                  border: TableBorder.all(color: Colors.grey),
                  columnWidths: {
                    0: FlexColumnWidth(1),
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
                    for (int i = 0; i < _getMaxLength(serviceInfo); i++)
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_getValue(serviceInfo.clients, i),
                                style: TextStyle(fontSize: 12)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(_getValue(serviceInfo.agencyAction, i),
                                style: TextStyle(fontSize: 12)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                _getValue(
                                    serviceInfo.fees, i), // Only show fees once
                                style: TextStyle(fontSize: 12)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                _getValue(serviceInfo.processingTime, i),
                                style: TextStyle(fontSize: 12)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                _getValue(serviceInfo.personResponsible, i),
                                style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                  ],
                ),
                SizedBox(height: 20), // Spacing between tables
              ],
              Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: {
                  0: FlexColumnWidth(1),
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
                        child: Text('',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'TOTAL:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          service.servicesInfos.first.totalFees,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          service.servicesInfos.first.totalResponseTime,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

int _getMaxLengthChecklist(service) {
  return [
    service.checklistOfRequirements.length,
    service.whereToSecure.length,
  ].reduce((value, element) => value > element ? value : element);
}

int _getMaxLength(serviceInfo) {
  return [
    serviceInfo.clients.length,
    serviceInfo.agencyAction.length,
    serviceInfo.processingTime.length,
    serviceInfo.personResponsible.length,
  ].reduce((value, element) => value > element ? value : element);
}

String _getValue(List<String> list, int index) {
  return index < list.length
      ? list[index]
      : ''; // Return empty if out of bounds
}
