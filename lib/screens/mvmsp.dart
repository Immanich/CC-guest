import 'package:flutter/material.dart';

class Mvmsp extends StatelessWidget {
  const Mvmsp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'MVMSP',
            style: TextStyle(fontFamily: "Gilroy"),
          ),
          // titleSpacing: 110,
          backgroundColor: Color.fromARGB(255, 182, 199, 255),
          toolbarHeight: 70,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
            color: Color(0xffffffff),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(5)), // Set the border radius
                color: Color(0xffCCD8FE), // Set the background color
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'I. MANDATE',
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "The RA 7160 also known as the Local Government Code of 1991 give the local governments powers to ensure the preservation and enhancement of culture, promotion of health and safety, right of people to a balanced ecology, development of technical capabilities, improvement of public morals, economic prosperity and social justice, full employment of residents, peace and order, and the convenience of inhabitants.",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'II. VISION',
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "TUBIGON is a prime eco-cultural tourism destination and economically vibrant trading center, and productive agro-industrial municipality in the region led by competent, dynamic, and committed leaders, with family-oriented, God-loving, and empowered people sustainably managing the environment.",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'III. MISSION',
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "To create a positive environment for sustainable growth through the provision of effective and efficient services, and sound local governance that will improve the quality of life its citizenry.",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'IV. SERVICE PLEDGE',
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "We, the officials and employees of the Local Government Unit of Tubigon, do hereby pledge our strong commitment to perform our duties and functions with utmost goal to ensure its citizenry have the opportunity to:",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Image.asset('assets/images/abante.png',
                        width: double.infinity),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
