import 'package:blogger/core/error/failure.dart';
import 'package:blogger/featuers/posts/domain/entities/post.dart';
import 'package:blogger/featuers/posts/domain/repo/post_repo.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUseCase {
  final PostsRepo repo;
  UpdatePostUseCase(this.repo);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repo.updatePost(post);
  }
}
