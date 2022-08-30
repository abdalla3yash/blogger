import 'package:blogger/core/error/failure.dart';
import 'package:blogger/featuers/posts/domain/entities/post.dart';
import 'package:blogger/featuers/posts/domain/repo/post_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUseCase {
  final PostsRepo repo;

  GetAllPostsUseCase(this.repo);

  Future<Either<Failure, List<Post>>> call() async {
    return await repo.getAllPosts();
  }
}
