import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class ToDoModel extends HiveObject with EquatableMixin {
  ToDoModel({
    required this.title,
    required this.desc,
    required this.isTaskCompleted,
  });

  @HiveField(0)
  String title;
  @HiveField(1)
  String desc;
  @HiveField(2)
  bool isTaskCompleted;

  @override
  List<Object?> get props => [title, desc, isTaskCompleted];
}
