// import 'package:citizen_charter/network_utils/api.dart';
import 'package:flutter/material.dart';
import '../models/event.dart';
import 'package:citizen_charter/network_utils/api.dart';

class Events extends StatefulWidget {
  // final Events event;

  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<Event> events = [];
  bool isLoading = true;
  String errorMessage = '';
  // late Future<List<dynamic>> futureEvent;
  // final Api _api = Api();
  // final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // futureEvents = fetchEvents();
    // futureEvent = _apiService.fetchEvents();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      List<dynamic> eventData = await ApiService().fetchEvents();
      setState(() {
        events = eventData.map((data) => Event.fromJson(data)).toList();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = 'Failed to load events: ${error.toString()}';
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

              if (events.isEmpty) {
                return Center(
                  child: Text(
                      'No events available'), // Show if no offices are found
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
                          child: Text('Events for you',
                              style: TextStyle(fontSize: 25),
                              textAlign: TextAlign.start),
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: events.map((event) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EventPage(event: event)));
                                //   Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => OfficeDetailsScreen(
                                //       office: office,
                                //       services: services,
                                //       servicesInfo: servicesInfo,
                                //     ),
                                //   ),
                                // );
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
            },
          ),
        ),
      ),
    );
  }
}

class EventPage extends StatelessWidget {
  final Event event;

  EventPage({required this.event});
  // final String title;
  // final String description;
  // final String imageUrl;
  // EventPage(
  //     {required this.title, required this.description, required this.imageUrl});

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
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              // padding: const EdgeInsets.fromLTRB(0, 0, 80, 5),
              alignment: Alignment.centerLeft,
              child: Text('Events for you',
                  style: TextStyle(fontSize: 25), textAlign: TextAlign.start),
            ),
            Container(
              width: double.infinity,
              child: Image.network(event.image, fit: BoxFit.contain),
              // child: Image.network(event.image),
            ),
            SizedBox(height: 10),
            Text(
              event.title,
              style: TextStyle(fontSize: 20, fontFamily: "Gilroy"),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              event.description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
