import 'dart:convert';
import 'package:http/http.dart' as http;

import 'photo.dart';

class RestService {
  static final RestService _instance = RestService._constructor();
  factory RestService() {
    return _instance;
  }

  RestService._constructor();

  // Change the baseUrl based on your laptop's IP address.
  // Make sure you use IP address, not 'localhost'
  // Don't use https for local JSON-Server
  // Make sure you specify the port number 3000

  static const String baseUrl = 'http://192.168.137.1:3000';

  Future get(String endpoint) async {
    final response = await http.get('$baseUrl/$endpoint');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future post(String endpoint, {dynamic data}) async {
    final response = await http.post('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future patch(String endpoint, {dynamic data}) async {
    final response = await http.patch('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future delete(String endpoint) async {
    final response = await http.delete('$baseUrl/$endpoint');

    if (response.statusCode == 200) {
      return;
    }
    throw response;
  }

  Future<List<Photo>> getAllPhotos() async {
    final listJson = await get('photos');
    return (listJson as List)
        .map((itemJson) => Photo.fromJson(itemJson))
        .toList();
  }

  Future<Photo> votePhoto({int id, bool like}) async {
    final photoJson = await get('photos/$id');
    Photo photo = Photo.fromJson(photoJson);
    photo.dislike += 1;
    var json;
    if (like) {
      photo.like += 1;
      json = await patch('photos/$id', data: {'like': photo.like});
    } else {
      photo.dislike += 0;
      json = await patch('photos/$id', data: {'dislike': photo.dislike});
    }
    return Photo.fromJson(json);
  }
}
