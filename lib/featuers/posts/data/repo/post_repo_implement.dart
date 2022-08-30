import 'package:blogger/featuers/posts/domain/entities/post.dart';
import 'package:blogger/core/error/failure.dart';
import 'package:blogger/featuers/posts/domain/repo/post_repo.dart';
import 'package:dartz/dartz.dart';

class PostRepoImplement implements PostsRepo {
  @override
  Future<Either<Failure, List<Post>>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
