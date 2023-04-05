import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:posts/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/post_model.dart';

abstract class BasePostLocalDataSource {
  Future<List<PostModel>>getCachedPosts() ;
  Future<void>cachePosts(List<PostModel>postModels) ;
}
const CACHED_POSTS = "CACHED_POSTS";
class PostLocalDataSource implements BasePostLocalDataSource{

  late final SharedPreferences sharedPreferences;

  @override
  Future<void> cachePosts(List<PostModel> postModels) async {
    List postModelToJson = postModels.map((postModel) => postModel.toMap()).toList();
    sharedPreferences.setString(CACHED_POSTS, jsonEncode(postModelToJson));

  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if(jsonString!=null)
      {
        List decodeJson = jsonDecode(jsonString) ;
        List <PostModel>jsonToPostModel = decodeJson.map((postModel) => PostModel.fromJson(postModel)).toList() ;
        return Future.value(jsonToPostModel);
      }
    else
      {
        throw EmptyCacheException() ;
      }
  }

}