import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/domain/core/failures/app_failures.dart';
import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';
import 'package:todo_app/src/domain/to_do/i_todo_repository.dart';
import 'package:todo_app/src/infrastructure/todo/hive_box.dart';
part 'todo_event.dart';
part 'todo_state.dart';

@injectable
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this.iTodoRepo) : super(TodoStateInitial()) {
    on<AddTodoEvent>((event, emit) async {
      await iTodoRepo.addTodo(toDoModel: event.toDoModel);
      add(GetTodoListEvent());
    });
    on<UpdateTodoEvent>((event, emit) async {
      await iTodoRepo.updateTodo(toDoModel: event.toDoModel);
      add(GetTodoListEvent());
    });
    on<GetTodoListEvent>((event, emit) async {
      emit(TodoStateLoading());
      try {
        final todoModelList = await iTodoRepo.getTodoList();
        final reversedList = todoModelList.reversed.toList();
        emit(
          TodoStateLoaded(
            todoModelList: reversedList,
          ),
        );
      } on NoDataFound catch (e) {
        emit(TodoStateError(e.errorMessage));
      }
    });
    on<DeleteTodoEvent>((event, emit) async {
      await iTodoRepo.deleteTodo(toDoModel: event.toDoModel);
      add(GetTodoListEvent());
    });
  }
  ITodoRepository iTodoRepo;
  @override
  Future<void> close() {
    HiveBoxs.closeHiveBox();
    return super.close();
  }
}
