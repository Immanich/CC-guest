import 'package:flutter/material.dart';
import 'package:citizen_charter/screens/bottom_navigation.dart';

class Continue extends StatelessWidget {
  const Continue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE7ECFE), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/TubigonLogo.png',
            width: 250,
            fit: BoxFit.contain,
          ),
          Text(
            'CITIZEN CHARTER',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                letterSpacing: 3.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Quick access to the \nservices offered by the \nMunicipality of Tubigon.',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w100,
                letterSpacing: 3.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFFCCD8FE), // change the background color here
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/bottom_nav'
                    // MaterialPageRoute(
                    //     builder: (context) => BottomNavigationBarApp()),
                    );
              },
              child: const Text(
                'CONTINUE AS GUEST',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w100),
              )),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
