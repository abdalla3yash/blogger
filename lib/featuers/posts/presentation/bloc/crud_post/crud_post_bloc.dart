import 'package:bloc/bloc.dart';
import 'package:blogger/core/error/failure.dart';
import 'package:blogger/core/strings/failures.dart';
import 'package:blogger/core/strings/messages.dart';
import 'package:blogger/featuers/posts/domain/entities/post.dart';
import 'package:blogger/featuers/posts/domain/usecases/add_post.dart';
import 'package:blogger/featuers/posts/domain/usecases/delete_post.dart';
import 'package:blogger/featuers/posts/domain/usecases/update_post.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'crud_post_event.dart';
part 'crud_post_state.dart';

class CrudPostBloc extends Bloc<CrudPostEvent, CrudPostState> {
  final AddPostUseCase addPost;
  final UpdatePostUseCase updatePost;
  final DeletePostUseCase deletePost;
  CrudPostBloc({
    required this.addPost,
    required this.updatePost,
    required this.deletePost,
  }) : super(CrudPostInitial()) {
    on<CrudPostEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingCrudPostState());
        final failureOrDoneMessage = await addPost(event.post);
        emit(
          eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            ADD_SUCCESS_MESSAGE,
          ),
        );
      } else if (event is UpdatePostEvent) {
        emit(LoadingCrudPostState());
        final failureOrDoneMessage = await updatePost(event.post);
        emit(
          eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            UPDATE_SUCCESS_MESSAGE,
          ),
        );
      } else if (event is DeletePostEvent) {
        emit(LoadingCrudPostState());
        final failureOrDoneMessage = await deletePost(event.postId);
        emit(
          eitherDoneMessageOrErrorState(
            failureOrDoneMessage,
            DELETE_SUCCESS_MESSAGE,
          ),
        );
      }
    });
  }

  CrudPostState eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorCrudPostState(
        message: mapFailureToMessage(failure),
      ),
      (_) => MessageCrudPostState(message: message),
    );
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
