import 'dart:convert';
import 'package:myfirstappflutter/model/comment_model.dart';
import 'package:http/http.dart' as http;
import 'package:myfirstappflutter/repositories/comments/comments_repository.dart';

class CommentsHttpRepository implements CommentRepository {

  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/$postId/comments"));
    if (response.statusCode == 200) {
      var jsonComment = jsonDecode(response.body);
      return (jsonComment as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
