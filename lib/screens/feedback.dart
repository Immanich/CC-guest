//THE SERVICES IS STILL NOT WORKING

import 'package:citizen_charter/models/service.dart';
import 'package:citizen_charter/network_utils/api.dart';
import 'package:citizen_charter/screens/office_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:citizen_charter/screens/services.dart' as office_services;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// import 'package:citizen_charter/screens/offices/office_dropdown.dart';

class Feedbacks extends StatefulWidget {
  const Feedbacks({super.key});

  @override
  State<Feedbacks> createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  String _selectedService = '';
  List<DropdownMenuItem<String>> _selectedServiceList = [];
  String? _selectedOffice = '';
  final TextEditingController _feedbackController = TextEditingController();
  final _nameController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  List<Map<String, String?>> feedbackSubmissions = [];
  final GlobalKey<OfficeDropdownState> _officeDropdownKey =
      GlobalKey<OfficeDropdownState>();

  @override
  void initState() {
    super.initState();
    _loadFeedbackSubmissions(); // Load feedback on page open
  }

  // Load feedback from SharedPreferences
  Future<void> _loadFeedbackSubmissions() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedFeedback = prefs.getString('feedback_submissions');

    if (savedFeedback != null) {
      setState(() {
        // Load the list of feedback submissions with the correct field names
        feedbackSubmissions = List<Map<String, String>>.from(
          json.decode(savedFeedback),
        );
      });
    }
  }

  Future<List<Map<String, String>>> _getFeedbackSubmissions() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedSubmissions = prefs.getString('feedback_submissions');

    if (savedSubmissions != null) {
      // Decode the JSON string into a list of feedback submissions
      List<dynamic> submissionsList = json.decode(savedSubmissions);

      return List<Map<String, String>>.from(submissionsList);
    }

    return [];
  }

  // Save feedback to SharedPreferences

  // Add new feedback and save it
  void _addFeedbackSubmission(Map<String, String> submission) {
    setState(() {
      // Make sure you're adding the actual office_name and service_name, not just the IDs.
      feedbackSubmissions.add({
        'name': submission['name'] ?? 'Anonymous',
        'office_name':
            submission['office_name'] ?? 'No Office', // Save office_name
        'service_name':
            submission['service_name'] ?? 'No Service', // Save service_name
        'feedback': submission['feedback'] ?? '',
        // 'submissionTime': submission['submissionTime'] ?? 'No time',
        // 'comment': submission['comment'] ?? ''
      });

      // Save the updated list to SharedPreferences
      _saveFeedbackSubmissions();
    });
  }

  Future<void> _saveFeedbackSubmissions() async {
    final prefs = await SharedPreferences.getInstance();

    // Save the entire list of feedback submissions, including office_name and service_name
    await prefs.setString(
      'feedback_submissions',
      json.encode(
          feedbackSubmissions), // This includes office_name and service_name
    );
  }

  void _itemFeedback() async {
    String feedbackText = _feedbackController.text;

    // Save feedback to local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> feedbackList = prefs.getStringList('feedbacks') ?? [];
    feedbackList.add(feedbackText);
    await prefs.setStringList('feedbacks', feedbackList);

    print('Feedback submitted: $feedbackText');
    _feedbackController.clear();
  }

  Future<void> fetchServicesForOfficeFeedback(int officeId) async {
    try {
      // Fetch services as a list of Service objects
      List<Service> services =
          await ApiService().fetchServicesForOfficeFeedback(officeId);

      // Log fetched services
      print('Fetched services for office $officeId: $services');

      // Check if services are empty
      if (services.isEmpty) {
        print('No services found for office $officeId');
      }

      // Map services to DropdownMenuItems, now using Service properties directly
      List<DropdownMenuItem<String>> serviceItems =
          services.map<DropdownMenuItem<String>>((service) {
        return DropdownMenuItem<String>(
          value: service.id
              .toString(), // Use the 'id' property of the Service class
          child: Text(service
              .service_name), // Use the 'service_name' property of the Service class
        );
      }).toList();

      // Update the state
      setState(() {
        _selectedServiceList = serviceItems;
        _selectedService = ''; // Reset selected service
      });

      // Log the updated service list
      print('Updated service list: $_selectedServiceList');
    } catch (error) {
      print('Error fetching services: $error');
    }
  }

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
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 215, 223, 255),
                      // border: Border.all(color: Color(0xff000000), width: 1.0),
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
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Name (optional)',
                                ),
                              ),
                              SizedBox(height: 10),
                              OfficeDropdown(
                                key: _officeDropdownKey,
                                onChanged: (office) {
                                  setState(() {
                                    _selectedOffice = office;
                                    _selectedService =
                                        ''; // Reset selected service
                                    _selectedServiceList =
                                        []; // Clear services list while fetching
                                  });

                                  // Call fetch services for the selected office
                                  fetchServicesForOfficeFeedback(int.parse(
                                      office)); // Ensure office ID is passed correctly
                                },
                              ),
                              SizedBox(height: 10),
                              DropdownButtonFormField<String>(
                                isDense: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'WHAT SERVICE?',
                                ),
                                value: _selectedService.isNotEmpty
                                    ? _selectedService
                                    : null,
                                items: _selectedServiceList.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.value,
                                    child: Column(
                                      children: [
                                        Text(item.child is Text
                                            ? (item.child as Text).data ?? ''
                                            : ''),
                                        SizedBox(
                                            height:
                                                8), // Add space between items
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedService = value ?? '';
                                  });
                                },
                                selectedItemBuilder: (BuildContext context) {
                                  return _selectedServiceList.map<Widget>(
                                      (DropdownMenuItem<String> item) {
                                    final selectedService =
                                        _selectedServiceList.firstWhere(
                                      (element) =>
                                          element.value == _selectedService,
                                      orElse: () => DropdownMenuItem<String>(
                                        value: 'none',
                                        child: Text('Service not found'),
                                      ),
                                    );

                                    return ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                      ),
                                      child: Text(
                                        selectedService.child is Text
                                            ? (selectedService.child as Text)
                                                    .data ??
                                                ''
                                            : '',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: _feedbackController,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Your Feedback',
                                  alignLabelWithHint: true,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Feedback is required before proceeding.';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print('Feedback submitted!');
                                    setState(() {
                                      String submissionTime =
                                          DateFormat('yyyy-MM-dd HH:mm:ss')
                                              .format(DateTime.now());
                                      feedbackSubmissions.add({
                                        'name': _nameController.text.isNotEmpty
                                            ? _nameController.text
                                            : 'Anonymous',
                                        'office_name': _selectedOffice,
                                        'service_name': _selectedService,
                                        'feedback': _feedbackController.text,
                                        'submissionTime': submissionTime,
                                      });

                                      _feedbackController.clear();
                                      _nameController.clear();
                                      _selectedOffice = null;
                                      _selectedService = '';
                                      _selectedServiceList = [];
                                      _officeDropdownKey.currentState
                                          ?.resetOffice();
                                    });
                                  } else {
                                    print('Please fill in the required fields');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color(0xff0EF64E).withOpacity(0.7),
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: Text('Submit'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // _buildFeedbackForm(),
                  SizedBox(height: 10),
                  if (feedbackSubmissions.isNotEmpty)
                    Column(
                      children: feedbackSubmissions.map((submission) {
                        return GestureDetector(
                          onTap: () {
                            var comment = submission['comment'];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                          name:
                                              submission['name'] ?? 'Anonymous',
                                          office: submission['office_name'] ??
                                              'Anonymous',
                                          service: submission['service_name'] ??
                                              'Anonymous',
                                          feedback: submission['feedback'] ??
                                              'Anonymous',
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 10, 16, 10),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 215, 223, 255),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.person),
                                          Container(
                                            width: 100,
                                            child: Text(
                                              ' ${submission['name']}',
                                              style: TextStyle(fontSize: 16),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          child: Text(
                                              (submission['submissionTime'] ??
                                                  'No time available'))),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Office: ${submission['office_name']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Service: ${submission['service_name']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Feedback: ${submission['feedback']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.message_rounded, size: 24),
                                          SizedBox(width: 2),
                                          Container(child: Text('Comment')),
                                        ],
                                      ),
                                      SizedBox(width: 15),
                                      Row(
                                        children: [
                                          Icon(Icons.thumb_up_sharp, size: 24),
                                          SizedBox(width: 2),
                                          Container(child: Text('Helpful'))
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
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

class DetailsPage extends StatefulWidget {
  final String name;
  final String office;
  final String service;
  final String feedback;
  // final Map<String, dynamic> comment;

  DetailsPage({
    required this.name,
    required this.office,
    required this.service,
    required this.feedback,
    // required this.comment,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // FocusNode _focusNode = FocusNode();

  FocusNode _focusNode = FocusNode();
  bool _isTextFieldFocused = false;
  String _inputText = '';
  List<String> _sentText = [];

  @override
  void initState() {
    super.initState();
    _loadSentTexts();

    // Listen to the focus state of the TextField
    _focusNode.addListener(() {
      setState(() {
        _isTextFieldFocused = _focusNode.hasFocus;
      });
    });
  }

  final TextEditingController _textController =
      TextEditingController(); // Controller for the TextFormField

  Future<void> _loadSentTexts() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedTexts = prefs.getString('sent_texts');
    if (savedTexts != null) {
      setState(() {
        _sentText = List<String>.from(json.decode(savedTexts)); // Decode JSON
      });
    }
  }

  Future<void> _saveSentTexts() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('sent_texts', json.encode(_sentText)); // Encode JSON
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _handleSend() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _sentText.add(_textController.text); // Add the new text to the list
        _textController.clear(); // Clear the input field
        _saveSentTexts(); // Save the updated list of texts
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String _message = ''; // To store a message for user feedback

    double bottomSheetHeight = MediaQuery.of(context).size.height / 15;

    return Scaffold(
      appBar: AppBar(
        title: Text('FEEDBACK', style: TextStyle(fontFamily: "Gilroy")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 32),
                SizedBox(width: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 110,
                      child: Text(
                        '${widget.name}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // SizedBox(height: 10),
                    Container(
                      width: 110,
                      child: Text(
                        '${widget.office}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Container(
                    height: 40,
                    child: VerticalDivider(
                        width: 20,
                        color: Colors.black.withOpacity(0.7),
                        thickness: 1)),
                Container(
                  width: 150,
                  child: Text(
                    '${widget.service}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '${widget.feedback}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _sentText.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      _sentText[index],
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            _buildBottomSheet(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black.withOpacity(0.5),
            width: 1.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 218, 218, 218),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Write a comment...',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
            ),
            SizedBox(width: 5),
            GestureDetector(
              onTap: _handleSend,
              child: Icon(Icons.send, size: 30, color: Colors.blue[700]),
            )
          ],
        ),
      ),
    );
  }
}



// bottomSheet: Container(
      //   height: bottomSheetHeight,
      //   decoration: BoxDecoration(
      //     // color: Colors.black38,
      //     border: Border(
      //       top: BorderSide(
      //         color: Colors.black
      //             .withOpacity(0.5), // Change this to your desired color
      //         width: 1.0, // Change the width as needed
      //       ),
      //     ),
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      //     child: Row(
      //       children: [
      //         Expanded(
      //           child: TextFormField(
      //             controller: _textController,
      //             decoration: InputDecoration(
      //               fillColor: const Color.fromARGB(
      //                   255, 218, 218, 218), // Background color
      //               filled: true,
      //               border: OutlineInputBorder(
      //                 borderRadius:
      //                     BorderRadius.circular(30.0), // Rounded corners
      //                 borderSide: BorderSide.none, // No border line
      //               ),
      //               contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
      //             ),
      //             onFieldSubmitted: (text) {
      //               setState(() {
      //                 _inputText = text;
      //               });
      //             },
      //           ),
      //         ),
      //         GestureDetector(
      //           onTap: _handleSend,
      //           child: Icon(Icons.send, size: 30, color: Colors.blue[700]),
      //         )
      //       ],
      //     ),
      //   ),
      // ),



              // ElevatedButton(
              //   child: Text('Button'), // Replace with your desired button text
              //   onPressed: () {
              //     // You can also add additional logic here if needed
              //     setState(() {
              //       // If you want to clear the input field after button press
              //       // _inputText = '';
              //     });
              //   },
              // ),
// child: TextField(
          //   focusNode: _focusNode,
          //   decoration: InputDecoration(
          //     // Use InputBorder.none for the default state
          //     border: InputBorder.none,
          //     // Apply OutlineInputBorder for enabled and focused states
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(30.0),
          //       borderSide: BorderSide.none, // No border color
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(30.0),
          //       borderSide: BorderSide.none, // No border color
          //     ),
          //     fillColor: const Color.fromARGB(255, 186, 186, 186)
          //         .withOpacity(0.5), // Set your desired background color
          //     filled: true,
          //     hintText: 'Write a comment...',
          //     contentPadding:
          //         EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          //   ),
          // ),
