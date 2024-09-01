import 'package:citizen_charter/screens/continue.dart';
import 'package:flutter/material.dart';

class Open extends StatelessWidget {
  const Open({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFE7ECFE),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/continue');
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/TubigonLogo.png',
                width: 350,
                fit: BoxFit.contain,
              ),
              Transform.translate(
                offset: Offset(0, -50),
                child: Text(
                  'CITIZEN\nCHARTER',
                  style: TextStyle(
                      fontSize: 33,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      // color: Colors.black,
                      letterSpacing: 3.0,
                      height: 1.2),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
