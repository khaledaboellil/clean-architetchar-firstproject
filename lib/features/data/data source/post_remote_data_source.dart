import 'dart:convert';

import 'package:posts/core/error/exceptions.dart';

import '../../domain/entites/posts.dart';
import '../models/post_model.dart';
import 'package:http/http.dart' as http;
abstract class BasePostRemoteDataSource {
  Future<List<PostModel>>getAllPosts();
  Future<void>updatePost(Post post);
  Future<void>addPost(Post post);
  Future<void>deletePost(int id);
}
const BASE_URL = "https://jsonplaceholder.typicode.com";

class PostRemoteDataSource extends BasePostRemoteDataSource{
  late final http.Client client;
  PostRemoteDataSource({required this.client});

  @override
  Future<List<PostModel>> getAllPosts() async{
    final response = await client.get(
      Uri.parse(BASE_URL + "/posts/"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = jsonDecode(response.body) as List;
      List<PostModel> postModels = decodedJson.map((e) =>PostModel.fromJson(e)).toList();
      return postModels ;
    }
    else
      {
        throw ServerException() ;
      }
  }

  @override
  Future<void> addPost(Post post) async{
    final body = {
      "title": post.title,
      "body": post.body,
    };

    final response =
        await client.post(Uri.parse(BASE_URL + "/posts/"), body: body);

    if (response.statusCode == 201) {

    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> deletePost(int id) async{
    final response = await client.delete(
      Uri.parse(BASE_URL + "/posts/${id.toString()}"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {

    } else {
      throw ServerException();
    }
  }


  @override
  Future<void> updatePost(Post post) async{
    final postId = post.id.toString();
    final body = {
      "title": post.title,
      "body": post.body,
    };

    final response =
        await client.post(Uri.parse(BASE_URL + "/posts/$postId"), body: body);

    if (response.statusCode == 200) {

    } else {
      throw ServerException();
    }
  }

}