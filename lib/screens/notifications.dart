import 'package:citizen_charter/models/notification.dart';
import 'package:citizen_charter/models/event.dart';
import 'package:citizen_charter/network_utils/api.dart';
import 'package:citizen_charter/screens/events.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<NotificationModel> notifications = [];
  List<Event> eventsList = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    try {
      List<dynamic> notificationData = await ApiService().fetchNotifications();

      List<NotificationModel> notificationsList = [];
      Map<int, Event> eventsMap = {};

      for (var data in notificationData) {
        NotificationModel notification = NotificationModel.fromJson(data);
        notificationsList.add(notification);

        try {
          print(
              'Fetching event data for event ID: ${notification.eventId}'); // Print the event ID
          dynamic eventData =
              await ApiService().fetchEventById(notification.eventId);
          print('Event data: $eventData'); // Print the event data
          Event event = Event.fromJson(eventData);
          eventsMap[notification.eventId] = event;
        } catch (error) {
          print('Error fetching event data: ${error.toString()}');
        }
      }

      setState(() {
        notifications = notificationsList;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = 'Failed to load notifications: ${error.toString()}';
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
          child: LayoutBuilder(builder:
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

            if (notifications.isEmpty) {
              return Center(
                child: Text('No notifications available'),
              );
            }

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 80, 5),
                        alignment: Alignment.center,
                        child: Text('Notifications for you',
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.start),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: notifications.map((notification) {
                          Event event = eventsList[notification.eventId];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EventPage(event: event)));
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 250,
                                  height: 150,
                                  // child: Image.network(event.image),
                                  child: Image.network(event.image),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  event.title,
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// Future<void> fetchNotifications() async {
//   try {
//     List<dynamic> notificationData = await ApiService().fetchNotifications();
//     List<NotificationModel> notificationsList = notificationData
//         .map((data) => NotificationModel.fromJson(data))
//         .toList();

//     for (var notification in notificationsList) {
//       try {
//         dynamic eventData =
//             await ApiService().fetchEventById(notification.eventId);
//         Event event = Event.fromJson(eventData);
//         eventsList.add(event);
//       } catch (error) {
//         print('Error fetching event data: ${error.toString()}');
//       }
//     }

//     setState(() {
//       notifications = notificationsList;
//       eventsList = eventsList;
//       isLoading = false;
//     });
//   } catch (error) {
//     setState(() {
//       errorMessage = 'Failed to load notifications: ${error.toString()}';
//       isLoading = false;
//     });
//   }
// }

// }
// child: FutureBuilder(
//   future: fetchNotifications(),
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       List<NotificationModel> notifications = snapshot.data;
//       return ListView.builder(
//         itemCount: notifications.length,
//         itemBuilder: (context, index) {
//           NotificationModel notification = notifications[index];
//           return GestureDetector(
//             onTap: () {},
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(
//                       50), // adjust the radius as needed
//                   child: Container(
//                     width: 100,
//                     height: 100,
//                     child: Image.network(
//                       notification.event
//                           .image, // assuming the event image is stored in the database
//                       width: 80,
//                       height: 80,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Flexible(
//                   child: Text(
//                     notification.event
//                         .title, // assuming the event title is stored in the database
//                     style: TextStyle(fontSize: 16),
//                     textAlign: TextAlign.left,
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       );
//     } else if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     } else {
//       return Center(child: CircularProgressIndicator());
//     }
//   },
// ),
// @override
// Widget build(BuildContext context) {
//   return LayoutBuilder(
//     builder: (BuildContext context, BoxConstraints viewportConstraints) {
//       return SingleChildScrollView(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             minHeight: viewportConstraints.maxHeight,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 SizedBox(height: 10),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(
//                             50), // adjust the radius as needed
//                         child: Container(
//                           width: 100,
//                           height: 100,
//                           child: Image.asset(
//                             'assets/images/event-pic-1.png',
//                             width: 80,
//                             height: 80,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Flexible(
//                         child: Text(
//                           "Buy your tickets for Miss Bohol 2024!",
//                           style: TextStyle(fontSize: 16),
//                           textAlign: TextAlign.left,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
// }

class NotificationPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  NotificationPage(
      {required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 182, 199, 255),
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
        child: Column(
          children: <Widget>[
            Container(
              // padding: const EdgeInsets.fromLTRB(0, 0, 80, 5),
              alignment: Alignment.centerLeft,
              child: Text('Events for you',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.start),
            ),
            Container(
              width: double.infinity,
              child: Image.asset(imageUrl, fit: BoxFit.contain),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontFamily: "Gilroy"),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}


// GestureDetector(
//                     onTap: () {},
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(
//                               50), // adjust the radius as needed
//                           child: Container(
//                             width: 100,
//                             height: 100,
//                             child: Image.asset(
//                               'assets/images/event-pic-2.png',
//                               width: 80,
//                               height: 80,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Flexible(
//                           child: Text(
//                             "Tubigon’s representative for the Mister Bohol 2024 competition",
//                             style: TextStyle(fontSize: 16),
//                             textAlign: TextAlign.left,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(
//                               50), // adjust the radius as needed
//                           child: Container(
//                             width: 100,
//                             height: 100,
//                             child: Image.asset(
//                               'assets/images/event-pic-3.png',
//                               width: 80,
//                               height: 80,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Flexible(
//                           child: Text(
//                             "TERSSU personnel at your service!",
//                             style: TextStyle(fontSize: 16),
//                             textAlign: TextAlign.left,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(
//                               50), // adjust the radius as needed
//                           child: Container(
//                             width: 100,
//                             height: 100,
//                             child: Image.asset(
//                               'assets/images/event-pic-3.png',
//                               width: 80,
//                               height: 80,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Flexible(
//                           child: Text(
//                             "TERSSU personnel at your service!",
//                             style: TextStyle(fontSize: 16),
//                             textAlign: TextAlign.left,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),