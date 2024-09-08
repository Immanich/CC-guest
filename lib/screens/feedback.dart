//THE SERVICES IS STILL NOT WORKING

import 'package:citizen_charter/screens/offices/office_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:citizen_charter/screens/offices/services.dart'
    as office_services;
import 'package:citizen_charter/screens/offices/office_dropdown.dart';

class Feedbacks extends StatefulWidget {
  const Feedbacks({super.key});

  @override
  State<Feedbacks> createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  String _selectedService = '';
  List<DropdownMenuItem<String>> _selectedServiceList = [];
  String _selectedOffice = '';
  final TextEditingController _feedbackController = TextEditingController();
  final _nameController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/CCHandshake.png',
            width: 60,
          ),
          toolbarHeight: 70,
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 20), // Increased padding
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5), // Increased padding
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff000000), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset('assets/images/TubigonLogo.png',
                              width: 80),
                        ),
                        SizedBox(height: 10), // Added whitespace
                        Container(
                          child: Text(
                            'FEEDBACK AND REDRESS MECHANISMS',
                            style: TextStyle(
                                fontFamily: "Open Sans", // Changed font family
                                fontSize: 20, // Increased font size
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10), // Added whitespace
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                'Kindly choose one of the feedback options below:',
                                textAlign: TextAlign.justify,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily:
                                      "Open Sans", // Changed font family
                                  // Increased font size
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10), // Added whitespace
                        Container(
                          // height: 200,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              GestureDetector(
                                onTap: _scrollToFeedback,
                                child: ListTile(
                                  leading: Text(
                                    '•',
                                    style: TextStyle(
                                      fontFamily: "Open Sans",
                                      fontSize: 16,
                                    ),
                                  ),
                                  title: Text(
                                    "Submitting a feedback below.",
                                    style: TextStyle(
                                      fontFamily: "Open Sans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration
                                          .underline, // Underlined text
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Text('•',
                                    style: TextStyle(
                                        // Increased font size
                                        fontFamily: "Open Sans",
                                        fontSize: 16 // Changed font family
                                        )),
                                title: Text(
                                  "Accomplish our Customer Feedback Form and put in the drop box at the SUGGESTION BOX.",
                                  style: TextStyle(
                                      // Increased font size
                                      fontFamily:
                                          "Open Sans", // Changed font family
                                      fontSize: 16),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              ListTile(
                                leading: Text('•',
                                    style: TextStyle(
                                        // Increased font size
                                        fontFamily:
                                            "Open Sans", // Changed font family
                                        fontSize: 16)),
                                title: Text(
                                  "Talk to our OFFICER OF THE DAY",
                                  style: TextStyle(
                                      // Increased font size
                                      fontFamily:
                                          "Open Sans", // Changed font family
                                      fontSize: 16),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10), // Added whitespace
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                'If you are not satisfied with our service, your written/verbal  complaints shall immediately be attended to by the Action Officer at the Public Assistance and Complaints  Desk.',
                                textAlign: TextAlign.justify,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily:
                                      "Open Sans", // Changed font family
                                  // Increased font size
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20), // Added whitespace
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                'THANK YOU for helping us continuosly improve our service.',
                                textAlign: TextAlign.justify,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily:
                                      "Open Sans", // Changed font family
                                  // Increased font size
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // Increased padding
                    decoration: BoxDecoration(
                      color: Color(0xffCFD9FD),
                      border: Border.all(color: Color(0xff000000), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Text(
                          'FEEDBACKS',
                          style: TextStyle(
                              fontFamily: "Open Sans",
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        )),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name (optional)',
                          ),
                        ),
                        SizedBox(height: 10),
                        OfficeDropdown(
                          onChanged: (office) {
                            setState(() {
                              _selectedOffice = office;
                              _selectedService = '';
                              _selectedServiceList =
                                  office_services.getServices(office);
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'WHAT SERVICE?',
                          ),
                          value: _selectedService.isNotEmpty
                              ? _selectedService
                              : null,
                          items: _selectedServiceList,
                          onChanged: (value) {
                            setState(() {
                              _selectedService = value ?? '';
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _feedbackController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your Feedback',
                            alignLabelWithHint: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _feedbackController.clear();
                              _nameController.clear();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0EF64E)
                                .withOpacity(0.7), // Set the background color
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Set the border radius to 5
                            ),
                          ),
                          child: Text('Submit'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _submitFeedback() {
    String feedbackText = _feedbackController.text;

    print('Feedback submitted: $feedbackText');
    _feedbackController.clear();
  }

  void _scrollToFeedback() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

// void