import 'package:fetch_data_app/model/post.dart';
import 'package:fetch_data_app/service/post_service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var service = PostService();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Albums app"),
        ),
        body: FutureBuilder(
          future: service.fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Si l'on récupère la data correctement, afficher un ListView
              var posts = snapshot.data!;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) =>
                    _listElement(context, posts[index]),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // Par défaut, afficher un Spinner
            return const CircularProgressIndicator();
          },
        ));
  }

  _listElement(context, Post post) {
    // Chaque élément de notre ListView est un Widget Card
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(post.body)
          ],
        ),
      ),
    );
  }
}
