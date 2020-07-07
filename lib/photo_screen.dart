import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  final String url;

  PhotoScreen({this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: double.maxFinite,
        child: Image.network(
          url,
          fit: BoxFit.fitWidth,
        ),
      ),
    ));
  }
}
