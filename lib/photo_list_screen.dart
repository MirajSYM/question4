import 'package:flutter/material.dart';

import 'photo.dart';
import 'photo_screen.dart';
import 'rest_service.dart';

class PhotoListScreen extends StatefulWidget {
  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  RestService service = RestService();
  List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photo>>(
        future: service.getAllPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            photos = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

  Widget _buildMainScreen() {
    return Scaffold(
      body: ListView.separated(
        itemCount: photos.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: SizedBox(
                height: 120,
                child: InkWell(
                  child: Image.network(photos[index].thumbUrl),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PhotoScreen(url: photos[index].photoUrl)),
                    );
                  },
                )),
            trailing: _buildThumbButtons(photos[index]),
          );
        },
      ),
    );
  }

  Widget _buildThumbButtons([Photo photo]) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(photo.like.toString(),
            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        IconButton(
            icon: Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
            onPressed: () async {
              Photo update = await service.votePhoto(id: photo.id, like: true);
              setState(() {
                photo.like = update.like;
              });
            }),
        IconButton(
            icon: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
            onPressed: () async {
              Photo update = await service.votePhoto(id: photo.id, like: false);
              setState(() {
                photo.dislike = update.dislike;
              });
            }),
        Text(photo.dislike.toString(),
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15)),
      ],
    );
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching todo... Please wait'),
          ],
        ),
      ),
    );
  }
}
