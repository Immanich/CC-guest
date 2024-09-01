import 'package:citizen_charter/screens/accounting_services.dart';
import 'package:citizen_charter/screens/menu_btn.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyMedium!,
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // MenuBtn(),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => AccountingServices()),
                              // );
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xffCCD8FE),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Image.asset(
                                    'assets/images/icons/accounting_icon.png',
                                    width: 60,
                                    // fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Accounting Office",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Add your code here to handle the tap event
                              // Navigator.pushNamed(context, '/events');
                              // print('Assessor\'s Office icon tapped');
                            },
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xffCCD8FE),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Image.asset(
                                    'assets/images/icons/assessors_icon.png',
                                    width: 60,
                                    // fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Assessor's Office",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          // MenuBtn()
                        ],
                      ),
                    ],
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
