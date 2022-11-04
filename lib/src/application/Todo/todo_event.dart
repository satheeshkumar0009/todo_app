part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoEvent {
  const AddTodoEvent(this.toDoModel);

  final ToDoModel toDoModel;
  @override
  List<Object> get props => [toDoModel];
}

class UpdateTodoEvent extends TodoEvent {
  const UpdateTodoEvent(this.toDoModel);

  final ToDoModel toDoModel;
  @override
  List<Object> get props => [toDoModel];
}

class GetTodoListEvent extends TodoEvent {}

class DeleteTodoEvent extends TodoEvent {
  const DeleteTodoEvent(this.toDoModel);

  final ToDoModel toDoModel;
  @override
  List<Object> get props => [toDoModel];
}
