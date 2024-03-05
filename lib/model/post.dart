class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Post.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] as int,
        id = json['id'] as int,
        title = json['title'] as String,
        body = json['body'] as String;
}
