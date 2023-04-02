import '../entites/posts.dart';

abstract class PostRepositery {

  Future<List<Post>> getAllPosts() ;
  Future <bool> deletePost(int id );
  Future <bool> addPost(Post post );
  Future <bool> updatePost(Post post );
}