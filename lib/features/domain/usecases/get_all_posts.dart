import 'package:dartz/dartz.dart';
import 'package:posts/features/domain/repostiry/post_repositery.dart';

import '../../../core/error/failure.dart';
import '../entites/posts.dart';

class GetAllPostsUseCase{
  final PostRepositery repositery;

  GetAllPostsUseCase(this.repositery) ;
  Future<Either<Failure,List<Post>>> call() async{
    return await repositery.getAllPosts() ;
    }
}