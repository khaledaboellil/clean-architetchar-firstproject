import 'package:dartz/dartz.dart';
import 'package:posts/core/error/failure.dart';
import 'package:posts/features/data/data%20source/post_remote_data_source.dart';
import 'package:posts/features/domain/entites/posts.dart';
import 'package:posts/features/domain/repostiry/post_repositery.dart';

class PostRepoisteryImpl implements PostRepositery{
  final PostRemoteDataSource postRemoteDataSource ;

  PostRepoisteryImpl(this.postRemoteDataSource);
  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async{
     await postRemoteDataSource.getAllPosts();
     throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> addPost(Post post) {
  postRemoteDataSource.addPost(post);
  throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deletePost(int id) {
    throw UnimplementedError();
  }



  @override
  Future<Either<Failure, void>> updatePost(Post post) {
    throw UnimplementedError();

  }

}