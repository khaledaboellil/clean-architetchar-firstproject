import 'package:dartz/dartz.dart';
import 'package:posts/features/domain/repostiry/post_repositery.dart';

import '../../../core/error/failure.dart';
import '../entites/posts.dart';

class DeletePostUseCase{
  final PostRepositery repositery;

  DeletePostUseCase(this.repositery) ;
  Future<Either<Failure,void>> call(int PostId) async{
    return await repositery.deletePost(PostId) ;
  }
}