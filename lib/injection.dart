import 'package:blogger/core/network/network_info.dart';
import 'package:blogger/featuers/posts/data/datasources/local_data_source.dart';
import 'package:blogger/featuers/posts/data/datasources/remote_datasource.dart';
import 'package:blogger/featuers/posts/data/repo/post_repo_implement.dart';
import 'package:blogger/featuers/posts/domain/repo/post_repo.dart';
import 'package:blogger/featuers/posts/domain/usecases/add_post.dart';
import 'package:blogger/featuers/posts/domain/usecases/delete_post.dart';
import 'package:blogger/featuers/posts/domain/usecases/get_all_posts.dart';
import 'package:blogger/featuers/posts/domain/usecases/update_post.dart';
import 'package:blogger/featuers/posts/presentation/bloc/CRUD_post/crud_post_bloc.dart';
import 'package:blogger/featuers/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init() async {
  // bloc
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(
      () => CrudPostBloc(addPost: sl(), deletePost: sl(), updatePost: sl()));

  // useCases
  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => AddPostUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));

  // repo
  sl.registerLazySingleton<PostsRepo>(() => PostRepoImplement(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  // DataSource
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplement(client: sl()));

  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplement(sharedPreferences: sl()));

  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
