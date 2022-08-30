import 'package:bloc/bloc.dart';
import 'package:blogger/core/error/failure.dart';
import 'package:blogger/core/strings/failures.dart';
import 'package:blogger/featuers/posts/domain/entities/post.dart';
import 'package:blogger/featuers/posts/domain/usecases/get_all_posts.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPosts;
  PostsBloc({
    required this.getAllPosts,
  }) : super(PostsInitial()) {
    on<PostsEvent>(
      (event, emit) async {
        if (event is GetAllPostsEvent) {
          emit(LoadingPostsState());
          final failureOrPosts = await getAllPosts();
          emit(mapFailureOrPostsToState(failureOrPosts));
        } else if (event is RefreshPostsEvent) {
          emit(LoadingPostsState());
          final failureOrPosts = await getAllPosts();
          emit(mapFailureOrPostsToState(failureOrPosts));
        }
      },
    );
  }

  PostsState mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
    return either.fold(
      (failure) => ErrorPostsState(message: mapFailureToMessage(failure)),
      (posts) => LoadedPostsState(
        posts: posts,
      ),
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
