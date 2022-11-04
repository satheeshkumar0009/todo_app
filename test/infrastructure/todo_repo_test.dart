import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/src/application/Todo/todo_bloc.dart';
import 'package:todo_app/src/domain/core/failures/app_failures.dart';
import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';

import 'package:todo_app/src/infrastructure/todo/todo_repository.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late MockTodoRepository todoRepository;
  late List<ToDoModel> _todoModelList;
  late TodoBloc todoBloc;
  setUp(() {
    todoRepository = MockTodoRepository();
    todoBloc = TodoBloc(todoRepository);
    _todoModelList = List.generate(
      10,
      (index) => ToDoModel(
        title: 'Flutter learning',
        desc: 'Ensure 10 hours daily',
        isTaskCompleted: false,
      ),
    ).toList();
  });

  group('TodoRepository', () {
    setUp(() {
      when(() => todoRepository.getTodoList())
          .thenAnswer((_) async => _todoModelList);
    });
    test('Receives data when getTodoList', () async {
      final result = await todoRepository.getTodoList();
      expect(
        result,
        _todoModelList,
      );
    });
    test('called getTodoList', () async {
      when(() => todoRepository.getTodoList())
          .thenAnswer((_) async => _todoModelList);
      todoBloc.add(GetTodoListEvent());
      verify(() => todoRepository.getTodoList()).called(1);
    });
  });
}
