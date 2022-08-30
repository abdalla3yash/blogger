import 'package:blogger/core/widgets/loading_widget.dart';
import 'package:blogger/featuers/posts/presentation/bloc/CRUD_post/crud_post_bloc.dart';
import 'package:blogger/featuers/posts/presentation/pages/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/snackbar.dart';
import 'delete_dialog_widget.dart';

class DeletePostBtnWidget extends StatelessWidget {
  final int postId;
  const DeletePostBtnWidget({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.redAccent,
        ),
      ),
      onPressed: () => deleteDialog(context, postId),
      icon: const Icon(Icons.delete_outline),
      label: const Text("Delete"),
    );
  }

  void deleteDialog(BuildContext context, int postId) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<CrudPostBloc, CrudPostState>(
            listener: (context, state) {
              if (state is MessageCrudPostState) {
                SnackBarMessage().showSuccessSnackBar(
                    message: state.message, context: context);

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(),
                    ),
                    (route) => false);
              } else if (state is ErrorCrudPostState) {
                Navigator.of(context).pop();
                SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingCrudPostState) {
                return const AlertDialog(
                  title: LoadingWidget(),
                );
              }
              return DeleteDialogWidget(postId: postId);
            },
          );
        });
  }
}
