import 'package:blogger/core/app_theme.dart';
import 'package:blogger/featuers/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:blogger/featuers/posts/presentation/pages/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'featuers/posts/presentation/bloc/CRUD_post/crud_post_bloc.dart';
import 'injection.dart' as GET;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GET.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => GET.sl<PostsBloc>()..add(GetAllPostsEvent())),
        BlocProvider(create: (_) => GET.sl<CrudPostBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blogger',
        theme: appTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
