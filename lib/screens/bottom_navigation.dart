// import 'package:flutter/material.dart';

// class BottomNavigation extends StatefulWidget {
//   final int currentIndex;
//   final Function(int) onTabTapped;

//   const BottomNavigation({
//     Key? key,
//     required this.currentIndex,
//     required this.onTabTapped,
//   }) : super(key: key);

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       key: UniqueKey(),
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.grey,
//       currentIndex: widget.currentIndex,
//       onTap: (index) {
//         // Call the onTabTapped function provided by the parent widget
//         widget.onTabTapped(index);
//       },
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.search),
//           label: 'Search',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.library_books),
//           label: 'Library',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.settings),
//           label: 'Settings',
//         ),
//       ],
//       backgroundColor: Colors.blue[900],
//     );
//   }
// }

import 'package:citizen_charter/screens/elected_officials.dart';
import 'package:citizen_charter/screens/events.dart';
import 'package:citizen_charter/screens/feedback.dart';
import 'package:citizen_charter/screens/home.dart';
import 'package:citizen_charter/screens/menu_btn.dart';
import 'package:citizen_charter/screens/mvmsp.dart';
import 'package:citizen_charter/screens/notifications.dart';
import 'package:citizen_charter/screens/organizational_chart.dart';
import 'package:citizen_charter/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:citizen_charter/utils/routes.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({super.key});

  @override
  _BottomNavigationBarAppState createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int _selectedIndex = 0;
  String _appBarTitle = 'OFFICES';

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Events(),
    Notifications(),
    Profile(),
  ];

  static const List<String> _appBarTitles = <String>[
    'OFFICES',
    'EVENTS',
    'NOTIFICATIONS',
    'PROFILE',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _appBarTitle = _appBarTitles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 182, 199, 255),
          title: Text(
            _appBarTitle,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          toolbarHeight: 70,
          actions: [
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 120, height: 50),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: PopupMenuButton(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('MVMSP'),
                      value: 'MVMSP',
                    ),
                    PopupMenuItem(
                      child: Text('Elected Officials'),
                      value: 'Elected Officials',
                    ),
                    PopupMenuItem(
                      child: Text('Organizational Chart'),
                      value: 'Organizational Chart',
                    ),
                    PopupMenuItem(
                      child: Text('Feedbacks'),
                      value: 'Feedbacks',
                    ),
                  ],
                  onSelected: (String newValue) {
                    if (newValue == 'MVMSP') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Mvmsp()), // Replace with your MVMSP page
                      );
                    } else if (newValue == 'Elected Officials') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ElectedOfficials()), // Replace with your Elected Officials page
                      );
                    } else if (newValue == 'Organizational Chart') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OrganizationalChart()), // Replace with your Organizational Chart page
                      );
                    } else if (newValue == 'Feedbacks') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Feedbacks()), // Replace with your Feedbacks page
                      );
                    }
                  },
                ),
              ),
            ),
            // SizedBox(width: 15)
          ]),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 182, 199, 255),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF567bf9),
        onTap: _onItemTapped,
      ),
    );
  }
}
