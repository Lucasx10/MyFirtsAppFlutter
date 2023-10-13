import 'package:dio/dio.dart';
import 'package:myfirstappflutter/model/comment_model.dart';
import 'package:myfirstappflutter/repositories/comments/comments_repository.dart';
import 'package:myfirstappflutter/repositories/jsonplaceholder_custon_dio.dart';

class CommentsDioRepository implements CommentRepository{
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var jsonPlaceHolderCustonDio = JsonPlaceHolderCustonDio();
    var response = await jsonPlaceHolderCustonDio.dio.get("/posts/$postId/comments");
    return (response.data as List).map((e) => CommentModel.fromJson(e)).toList();
  }
  
}