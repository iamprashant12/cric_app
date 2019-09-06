import 'package:cricket_app/model/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Stream<Post>> getPosts() async
{
  final String url = "https://api-cric-info.herokuapp.com/posts";
  final client = new http.Client();
  final stremPost = await client.send(http.Request('get', Uri.parse(url)));

  return stremPost.stream.transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => Post.fromJson(data));
}