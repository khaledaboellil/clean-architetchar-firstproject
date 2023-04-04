import '../models/post_model.dart';

abstract class BasePostLocalDataSource {
  Future<List<PostModel>>getCachedPosts() ;
  Future<void>cachePosts(List<PostModel>postModels) ;
}
class PostLocalDataSource implements BasePostLocalDataSource{
  @override
  Future<void> cachePosts(List<PostModel> postModels) {
    // TODO: implement cachePosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    // TODO: implement getCachedPosts
    throw UnimplementedError();
  }


}