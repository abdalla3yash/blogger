part of 'crud_post_bloc.dart';

abstract class CrudPostState extends Equatable {
  const CrudPostState();

  @override
  List<Object> get props => [];
}

class CrudPostInitial extends CrudPostState {}

class LoadingCrudPostState extends CrudPostState {}

class ErrorCrudPostState extends CrudPostState {
  final String message;
  const ErrorCrudPostState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageCrudPostState extends CrudPostState {
  final String message;
  const MessageCrudPostState({required this.message});
  @override
  List<Object> get props => [message];
}
