import 'package:blogger/featuers/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postsModel);
}

class LocalDataSourceImplement implements LocalDataSource {
  @override
  Future<Unit> cachePosts(List<PostModel> postsModel) {
    // TODO: implement cachePosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    // TODO: implement getCachedPosts
    throw UnimplementedError();
  }
}
