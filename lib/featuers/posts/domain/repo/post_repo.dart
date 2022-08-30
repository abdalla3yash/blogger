import 'package:blogger/core/error/failure.dart';
import 'package:blogger/featuers/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepo {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, Unit>> updatePost(Post post);
  Future<Either<Failure, Unit>> addPost(Post post);
}
