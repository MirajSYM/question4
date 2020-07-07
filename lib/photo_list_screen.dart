import 'package:flutter/material.dart';

import 'photo.dart';

class PhotoListScreen extends StatefulWidget {
  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Main screen')),
    );
  }

  Widget _buildMainScreen() {
    return Scaffold(
      body: ListView.separated(
        itemCount: 0,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: SizedBox(
                height: 80,
                child: InkWell(
                  onTap: () {},
                )),
            trailing: null,
          );
        },
      ),
    );
  }

  Widget _buildThumbButtons([Photo photo = null]) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('likes',
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        IconButton(
            icon: Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
            onPressed: () {}),
        IconButton(
            icon: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
            onPressed: () {}),
        Text('dislike',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15)),
      ],
    );
  }
}
