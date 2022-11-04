import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';

abstract class ITodoRepository {
  Future<void> addTodo({required ToDoModel toDoModel});
  Future<void> updateTodo({required ToDoModel toDoModel});
  Future<void> deleteTodo({required ToDoModel toDoModel});

  Future<List<ToDoModel>> getTodoList();
}
