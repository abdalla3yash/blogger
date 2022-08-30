import 'package:blogger/featuers/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteDataSource {
  Future<PostModel> getAllPosts();
  Future<Unit> deletePost(int postId);
  Future<Unit> update0Post(PostModel postmodel);
  Future<Unit> addPost(PostModel postmodel);
}

class RemoteDataSourceImplement implements RemoteDataSource {
  @override
  Future<Unit> addPost(PostModel postmodel) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int postId) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<PostModel> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> update0Post(PostModel postmodel) {
    // TODO: implement update0Post
    throw UnimplementedError();
  }
}
