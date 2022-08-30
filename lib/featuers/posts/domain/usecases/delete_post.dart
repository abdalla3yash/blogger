import 'package:blogger/core/error/failure.dart';
import 'package:blogger/featuers/posts/domain/repo/post_repo.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCase {
  final PostsRepo repo;
  DeletePostUseCase(this.repo);

  Future<Either<Failure, Unit>> call(int id) async {
    return await repo.deletePost(id);
  }
}
