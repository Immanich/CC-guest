import 'package:citizen_charter/screens/events.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EventPage(
                                  title:
                                      "Buy your tickets for Miss Bohol 2024!",
                                  imageUrl: 'assets/images/event-pic-1.png',
                                  description:
                                      "BUY YOUR TICKETS FOR MISS BOHOL 2024  as we rally behind Miss Tubigon, Dianne Mariel Ybañez\n\n"
                                      "General Admission Ticket: Php 150.00\n\n"
                                      "Get your tickets straight at the Municipal Tourism Office, Potohan, Tubigon, Bohol.\n\n"
                                      "PAGEANT DATE: July 12, 2024 (7PM)\n"
                                      "VENUE: Bohol Wisdom School Gym\n\n"
                                      "#MissBohol2024 #MissTubigon #AnyagSaTubigon #LGUTubigon #TourismTubigon #MarielYbañez",
                                )),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              50), // adjust the radius as needed
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/images/event-pic-1.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "Buy your tickets for Miss Bohol 2024!",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              50), // adjust the radius as needed
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/images/event-pic-2.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "Tubigon’s representative for the Mister Bohol 2024 competition",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              50), // adjust the radius as needed
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/images/event-pic-3.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "TERSSU personnel at your service!",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              50), // adjust the radius as needed
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/images/event-pic-3.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "TERSSU personnel at your service!",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              50), // adjust the radius as needed
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/images/event-pic-3.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "TERSSU personnel at your service!",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              50), // adjust the radius as needed
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                              'assets/images/event-pic-3.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "TERSSU personnel at your service!",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     // Add your code here to handle the tap event
                  //     // Navigator.pushNamed(context, '/events');
                  //     // print('Assessor\'s Office icon tapped');
                  //   },
                  //   child: Column(
                  //     children: <Widget>[
                  //       Container(
                  //         width: 250,
                  //         height: 150,
                  //         child: Image.asset(
                  //           'assets/images/event-pic-3.png',
                  //           width: 100,
                  //           fit: BoxFit.contain,
                  //         ),
                  //       ),
                  //       SizedBox(height: 10),
                  //       Text(
                  //         "TERSSU personnel at \nyour service!",
                  //         style: TextStyle(fontSize: 16),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

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
