import 'dart:convert';

import 'package:fetch_data_app/model/post.dart';
import 'package:http/http.dart' as http;

class PostService {
  List<Post> parsePosts(String responseBody) {
    // Parse la réponse en tant que liste de dynamic à l'aide de jsonDecode
    final List<dynamic> data = jsonDecode(responseBody);
    // Effectue un mapping de chaque élément 'dynamic' de notre List
    // Map un 'Post' grâce au constructeur .fromJson
    // Retourne une List<Post> avec .toList();
    return data.map<Post>((json) => Post.fromJson(json)).toList();
  }

  Future<List<Post>> fetchPosts() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));

    // Si l'on a un HTTP 200, on parse la réponse de notre webservice
    if (response.statusCode == 200) {
      return parsePosts(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
