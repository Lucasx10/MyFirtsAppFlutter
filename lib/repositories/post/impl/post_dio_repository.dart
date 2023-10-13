import 'package:myfirstappflutter/model/post_model.dart';
import 'package:myfirstappflutter/repositories/jsonplaceholder_custon_dio.dart';
import 'package:myfirstappflutter/repositories/post/post_repository.dart';
import 'package:dio/dio.dart';

class PostDioRepository implements PostRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var jsonPlaceHolderCustonDio = JsonPlaceHolderCustonDio();
    var response = await jsonPlaceHolderCustonDio.dio.get("/posts");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
