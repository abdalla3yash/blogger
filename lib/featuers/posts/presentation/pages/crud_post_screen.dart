import 'package:blogger/core/widgets/loading_widget.dart';
import 'package:blogger/featuers/posts/presentation/bloc/CRUD_post/crud_post_bloc.dart';
import 'package:blogger/featuers/posts/presentation/pages/home_Screen.dart';
import 'package:blogger/featuers/posts/presentation/widgets/crud_page/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/snackbar.dart';
import '../../domain/entities/post.dart';

class CrudPostScreen extends StatelessWidget {
  final Post? post;
  final bool isUpdatePost;
  const CrudPostScreen({Key? key, this.post, required this.isUpdatePost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(title: Text(isUpdatePost ? "Edit Post" : "Add Post"));
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocConsumer<CrudPostBloc, CrudPostState>(
            listener: (context, state) {
              if (state is MessageCrudPostState) {
                SnackBarMessage().showSuccessSnackBar(
                    message: state.message, context: context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false);
              } else if (state is ErrorCrudPostState) {
                SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingCrudPostState) {
                return const LoadingWidget();
              }

              return FormWidget(
                  isUpdatePost: isUpdatePost, post: isUpdatePost ? post : null);
            },
          )),
    );
  }
}
