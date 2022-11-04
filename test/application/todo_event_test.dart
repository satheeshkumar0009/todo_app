import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/src/application/Todo/todo_bloc.dart';
import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';

void main() {
  final todoModel = ToDoModel(
    title: 'Flutter learning',
    desc: 'Ensure 10 hours daily',
    isTaskCompleted: false,
  );

  group('AddTodoEvent', () {
    test('Supports value equality', () {
      expect(AddTodoEvent(todoModel), equals(AddTodoEvent(todoModel)));
    });

    test('props are correct', () {
      expect(
        AddTodoEvent(todoModel).props,
        equals(<Object?>[todoModel]),
      );
    });
  });
  group('UpdateTodoEvent', () {
    test('Supports value equality', () {
      expect(UpdateTodoEvent(todoModel), equals(UpdateTodoEvent(todoModel)));
    });

    test('props are correct', () {
      expect(
        UpdateTodoEvent(todoModel).props,
        equals(<Object?>[todoModel]),
      );
    });
  });
  group('GetTodoListEvent', () {
    test('Supports value equality', () {
      expect(GetTodoListEvent(), equals(GetTodoListEvent()));
    });
  });

  group('GetTodoListEvent', () {
    test('Supports value equality', () {
      expect(DeleteTodoEvent(todoModel), equals(DeleteTodoEvent(todoModel)));
    });
  });
}
