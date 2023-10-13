import 'package:myfirstappflutter/model/post_model.dart';

abstract class PostRepository{
  Future<List<PostModel>> getPosts();
}