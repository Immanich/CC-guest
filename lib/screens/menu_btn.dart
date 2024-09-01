import 'package:citizen_charter/screens/elected_officials.dart';
import 'package:citizen_charter/screens/organizational_chart.dart';
import 'package:citizen_charter/screens/feedback.dart';
import 'package:flutter/material.dart';

class MenuBtn extends StatefulWidget {
  final List<String> items;

  const MenuBtn({super.key, required this.items});
  @override
  State<MenuBtn> createState() => _MenuBtnState();
}

class _MenuBtnState extends State<MenuBtn> {
  static const List<Widget> _widgetOptions = <Widget>[
    ElectedOfficials(),
    OrganizationalChart(),
    Feedbacks()
  ];

  String title = 'Title';
  String item1 = 'Item 1';
  String item2 = 'Item 2';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(child: Text(item1), value: item1),
          PopupMenuItem(child: Text(item2), value: item2),
        ],
        onSelected: (String newValue) {
          setState(() {
            title = newValue;
          });
        },
      ),
      // ),
    );
  }
}
