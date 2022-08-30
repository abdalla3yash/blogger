import 'package:blogger/core/error/exception.dart';
import 'package:blogger/core/network/network_info.dart';
import 'package:blogger/featuers/posts/data/datasources/remote_datasource.dart';
import 'package:blogger/featuers/posts/domain/entities/post.dart';
import 'package:blogger/core/error/failure.dart';
import 'package:blogger/featuers/posts/domain/repo/post_repo.dart';
import 'package:dartz/dartz.dart';

import '../datasources/local_data_source.dart';

class PostRepoImplement implements PostsRepo {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepoImplement(
      this.remoteDataSource, this.localDataSource, this.networkInfo);
  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
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
