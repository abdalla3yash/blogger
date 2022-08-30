import 'package:blogger/core/error/failure.dart';
import 'package:blogger/featuers/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepo {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, void>> deletePost(int id);
  Future<Either<Failure, void>> updatePost(Post post);
  Future<Either<Failure, void>> addPost(Post post);
}
