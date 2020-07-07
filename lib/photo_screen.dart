import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: double.maxFinite,
        child: Image.network(
          'http://gmm.fc.utm.my/~jumail/photos/photo4.jpg',
          fit: BoxFit.fitWidth,
        ),
      ),
    ));
  }
}
