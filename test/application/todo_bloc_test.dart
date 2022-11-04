import 'dart:developer';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/src/application/Todo/todo_bloc.dart';
import 'package:todo_app/src/domain/core/failures/app_failures.dart';
import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';
import 'package:todo_app/src/domain/to_do/i_todo_repository.dart';
import 'package:todo_app/src/infrastructure/todo/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockTodoRepository extends Mock implements ITodoRepository {}

void main() {
  late ITodoRepository _todoRepository;
  late List<ToDoModel> _todoModelList;
  late TodoBloc todoBloc;

  setUp(() {
    _todoRepository = MockTodoRepository();
    print("set up call");

    _todoModelList = List.generate(
      10,
      (index) => ToDoModel(
        title: 'Flutter learning',
        desc: 'Ensure 10 hours daily',
        isTaskCompleted: false,
      ),
    );
  });

  blocTest<TodoBloc, TodoState>(
    '''
add GetTodoListEvent then first 
    TodoStateLoading then TodoStateLoaded state''',
    setUp: () {
      when(() => _todoRepository.getTodoList())
          .thenAnswer((invocation) async => _todoModelList);
    },
    build: () => TodoBloc(_todoRepository),
    act: (bloc) => bloc..add(GetTodoListEvent()),
    expect: () => [
      TodoStateLoading(),
      TodoStateLoaded(todoModelList: _todoModelList),
    ],
  );
  blocTest<TodoBloc, TodoState>(
    '''
add GetTodoListEvent then NoData Exeption 
ensure emit TodoStateError''',
    setUp: () {
      when(() => _todoRepository.getTodoList()).thenThrow(NoDataFound('no'));
    },
    build: () => TodoBloc(_todoRepository),
    act: (bloc) => bloc.add(GetTodoListEvent()),
    expect: () => [
      TodoStateLoading(),
      const TodoStateError('no'),
    ],
  );
}
