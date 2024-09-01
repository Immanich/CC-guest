import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  final ImageProvider imageProvider;

  ImageViewer({required this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
        imageProvider: imageProvider,
      ),
    );
  }
}
