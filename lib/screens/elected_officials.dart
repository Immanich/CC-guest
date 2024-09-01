// import 'package:flutter/material.dart';

// class ElectedOfficials extends StatelessWidget {
//   const ElectedOfficials({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Elected Officials'),
//         backgroundColor: Color.fromARGB(255, 182, 199, 255),
//         toolbarHeight: 70,
//       ),
//       // body: // your page content here
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:citizen_charter/screens/imageview.dart';
import 'package:photo_view/photo_view.dart';

class ElectedOfficials extends StatelessWidget {
  const ElectedOfficials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ELECTED OFFICIALS',
          style: TextStyle(fontFamily: "Gilroy"),
        ),
        // titleSpacing: 30,
        backgroundColor: Color.fromARGB(255, 182, 199, 255),
        toolbarHeight: 70,
      ),
      body: Center(
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
              color: Colors
                  .white), // Set the background color of the PhotoView to white
          imageProvider: AssetImage('assets/images/elected_officials.png'),
          minScale: PhotoViewComputedScale.contained * 0.5,
          maxScale: PhotoViewComputedScale.covered * 2,
        ),
      ),
    );
  }
}
