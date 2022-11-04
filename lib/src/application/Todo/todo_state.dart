part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoStateInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoStateLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoStateLoaded extends TodoState {
  const TodoStateLoaded({
    required this.todoModelList,
  });

  final List<ToDoModel> todoModelList;

  @override
  List<Object> get props => [
        todoModelList,
      ];
}

class TodoStateError extends TodoState {
  const TodoStateError(this.failureMessage);

  final String failureMessage;
  @override
  List<Object> get props => [
        failureMessage,
      ];
}
