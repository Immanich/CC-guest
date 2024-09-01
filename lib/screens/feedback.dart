import 'package:flutter/material.dart';

class Feedbacks extends StatelessWidget {
  const Feedbacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/CCHandshake.png',
            width: 60,
          ),
          // titleSpacing: 30,
          // backgroundColor: Color.fromARGB(255, 182, 199, 255),
          toolbarHeight: 70,
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Container(
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
                    Container(
                      child: Text(
                        'FEEDBACK AND REDRESS \nMECHANISMS',
                        style: TextStyle(fontFamily: "Gilroy", fontSize: 23),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      child: Text(
                        'Kindly choose one of the feedback options \nbelow:',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    ListTile(
                                      leading: Text('•',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Gilroy")),
                                      title: Text(
                                          "Submitting a feedback below.",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Gilroy")),
                                    ),
                                  ],
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    ListTile(
                                      leading: Text('•',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Gilroy")),
                                      title: Text(
                                          "Accomplish our Customer Feedback Form and put in the drop box at the SUGGESTION BOX.",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Gilroy")),
                                    ),
                                  ],
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    ListTile(
                                      leading: Text('•',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Gilroy")),
                                      title: Text(
                                          "Talk to our OFFICER OF THE DAY.",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Gilroy")),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
