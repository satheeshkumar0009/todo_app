import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/src/application/Todo/todo_bloc.dart';
import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';

void main() {
  late List<ToDoModel> todoModelList;
  setUp(() {
    todoModelList = List.generate(
      10,
      (index) => ToDoModel(
        title: 'Flutter learning',
        desc: 'Ensure 10 hours daily',
        isTaskCompleted: false,
      ),
    );
  });

  group('todoStateInitial', () {
    test('supports value equality', () {
      expect(
        TodoStateInitial(),
        equals(TodoStateInitial()),
      );
    });
  });
  group('TodoStateLoading', () {
    test('supports value equality', () {
      expect(
        TodoStateLoading(),
        equals(TodoStateLoading()),
      );
    });
  });
  group('TodoStateLoading', () {
    test('supports value equality', () {
      expect(
        TodoStateLoaded(todoModelList: todoModelList),
        equals(TodoStateLoaded(todoModelList: todoModelList)),
      );
    });
    test('props are correct', () {
      expect(
        TodoStateLoaded(todoModelList: todoModelList).props,
        equals(<Object?>[todoModelList]),
      );
    });
  });
}
