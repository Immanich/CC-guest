import 'package:flutter/material.dart';
import 'package:citizen_charter/screens/imageview.dart';
import 'package:photo_view/photo_view.dart';

class OrganizationalChart extends StatelessWidget {
  const OrganizationalChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ORGANIZATIONAL CHART',
          style: TextStyle(fontFamily: "Gilroy"),
          textAlign: TextAlign.center,
        ),
        // titleSpacing: 0,
        backgroundColor: Color.fromARGB(255, 182, 199, 255),
        toolbarHeight: 70,
      ),
      body: Center(
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
              color: Colors
                  .white), // Set the background color of the PhotoView to white
          imageProvider: AssetImage('assets/images/org_chart.png'),
          minScale: PhotoViewComputedScale.contained * 0.5,
          maxScale: PhotoViewComputedScale.covered * 2,
        ),
      ),
    );
  }
}
