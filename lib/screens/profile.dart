import 'package:citizen_charter/screens/menu_btn.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.person_pin, size: 150),
          Text(
            'GUEST',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 15),
          // ElevatedButton(),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/continue'
                    // context,
                    // MaterialPageRoute(
                    //     builder: (context) => BottomNavigationBarApp()),
                    );
              },
              child: const Text(
                'EXIT',
                style: TextStyle(
                    color: Color(0xFFEF5350),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w100),
              )),
              // MenuBtn(items: items)
          // ),
        ],
      ),
    );
  }
}
