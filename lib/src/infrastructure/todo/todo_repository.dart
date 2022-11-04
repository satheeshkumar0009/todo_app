import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/core/failures/app_failures.dart';
import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';
import 'package:todo_app/src/domain/to_do/i_todo_repository.dart';
import 'package:todo_app/src/infrastructure/todo/hive_box.dart';

@LazySingleton(as: ITodoRepository)
class TodoRepository extends ITodoRepository {
  @override
  Future<void> addTodo({required ToDoModel toDoModel}) async {
    final todoDB = await HiveBoxs.getTodoBox();

    await todoDB.add(toDoModel);
    HiveBoxs.closeHiveBox();
  }

  @override
  Future<void> deleteTodo({required ToDoModel toDoModel}) async {
    await toDoModel.delete();
  }

  @override
  Future<List<ToDoModel>> getTodoList() async {
    final todoDB = await HiveBoxs.getTodoBox();
    final result = todoDB.values.toList();
    if (result.isEmpty) {
      throw NoDataFound('Not added todo');
    } else {
      final todoModelList = result;
      return todoModelList;
    }
  }

  @override
  Future<void> updateTodo({required ToDoModel toDoModel}) async {
    await toDoModel.save();
  }
}
