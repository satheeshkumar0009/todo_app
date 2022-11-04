import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';
import 'package:todo_app/src/infrastructure/core/hive_database.dart';

class HiveBoxs {
  static Future<Box<ToDoModel>> getTodoBox() async =>
      Hive.openBox<ToDoModel>(DbName.todoDB);
  static void closeHiveBox() => Hive.close();
}
