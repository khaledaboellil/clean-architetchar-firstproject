import 'package:dartz/dartz.dart';
import 'package:posts/core/error/failure.dart';
import 'package:posts/features/data/data%20source/post_remote_data_source.dart';
import 'package:posts/features/domain/entites/posts.dart';
import 'package:posts/features/domain/repostiry/post_repositery.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/network_info.dart';
import '../data source/post_local_data_source.dart';

class PostRepoisteryImpl implements PostRepositery{
  final BasePostRemoteDataSource postRemoteDataSource ;
  final BasePostLocalDataSource postLocalDataSource ;
  final NetworkInfo networkInfo;
  PostRepoisteryImpl(this.postRemoteDataSource,this.postLocalDataSource,this.networkInfo);
  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async{
    if(await networkInfo.isConnected)
      {
        try{
          final remotePosts = await postRemoteDataSource.getAllPosts();
          postLocalDataSource.cachePosts(remotePosts) ;
          return right(remotePosts) ;
        }
       on ServerException {
          return left(ServerFailure()) ;
        }

      }
    else{
      try {
        final localPosts = await postLocalDataSource.getCachedPosts();
        right(localPosts);
      }
      on EmptyCacheException {
        return left(EmptyCacheFailure()) ;
      }
    }
     throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> addPost(Post post)async {
      await getMessage(function: postRemoteDataSource.addPost(post));

      throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deletePost(int id) async{

    await getMessage(function:  postRemoteDataSource.deletePost(id));
    throw UnimplementedError();
  }



  @override
  Future<Either<Failure, void>> updatePost(Post post) async {
    await getMessage(function: postRemoteDataSource.updatePost(post)) ;
    throw UnimplementedError();

  }

  Future<Either<Failure,void>>getMessage({
    required function
})async{
    if(await networkInfo.isConnected)
    {
      try{
        function ;
      }
      on ServerException {
        return left(ServerFailure());
      }
    }
    else
    {
      return left(OfflineFailure());
    }
    throw UnimplementedError();
  }
}