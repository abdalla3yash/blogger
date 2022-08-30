import 'package:blogger/featuers/posts/domain/entities/post.dart';
import 'package:blogger/core/error/failure.dart';
import 'package:blogger/featuers/posts/domain/repo/post_repo.dart';
import 'package:dartz/dartz.dart';

import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';

class PostRepoImplement implements PostsRepo {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  PostRepoImplement(this.remoteDataSource, this.localDataSource);
  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    await remoteDataSource.getAllPosts();
    await localDataSource.getCachedPosts();
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
