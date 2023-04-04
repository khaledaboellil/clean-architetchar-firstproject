import '../../domain/entites/posts.dart';
import '../models/post_model.dart';

abstract class BasePostRemoteDataSource {
  Future<List<PostModel>>getAllPosts();
  Future<void>updatePost(Post post);
  Future<void>addPost(Post post);
  Future<void>deletePost(int id);
}

class PostRemoteDataSource extends BasePostRemoteDataSource{
  @override
  Future<void> addPost(Post post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

}