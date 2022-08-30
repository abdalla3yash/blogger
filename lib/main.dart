import 'package:blogger/core/app_theme.dart';
import 'package:blogger/core/network/network_info.dart';
import 'package:blogger/featuers/posts/data/datasources/local_data_source.dart';
import 'package:blogger/featuers/posts/data/datasources/remote_datasource.dart';
import 'package:blogger/featuers/posts/data/repo/post_repo_implement.dart';
import 'package:blogger/featuers/posts/domain/usecases/get_all_posts.dart';
import 'package:blogger/featuers/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'featuers/posts/presentation/bloc/CRUD_post/crud_post_bloc.dart';
import 'injection.dart' as GET;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GET.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GET.sl<PostsBloc>()),
        BlocProvider(create: (_) => GET.sl<CrudPostBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blogger',
        theme: appTheme,
        home: const Scaffold(
          body: Center(
            child: Text("Blogger"),
          ),
        ),
      ),
    );
  }
}
