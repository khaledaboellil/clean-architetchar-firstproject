import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entites/posts.dart';

abstract class PostRepositery {

  Future<Either<Failure,List<Post>>> getAllPosts() ;
  Future <Either<Failure,void>> deletePost(int id );
  Future <Either<Failure,void>> addPost(Post post );
  Future <Either<Failure,void>> updatePost(Post post );
}