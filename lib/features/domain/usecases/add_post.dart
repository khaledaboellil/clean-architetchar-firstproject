import 'package:dartz/dartz.dart';
import 'package:posts/features/domain/repostiry/post_repositery.dart';

import '../../../core/error/failure.dart';
import '../entites/posts.dart';

class AddPostUseCase{
  final PostRepositery repositery;

  AddPostUseCase(this.repositery) ;
  Future<Either<Failure,void>> call(Post post) async{
    return await repositery.addPost(post) ;
  }
}