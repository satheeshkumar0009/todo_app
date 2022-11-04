import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/application/Todo/todo_bloc.dart';
import 'package:todo_app/src/presentation/core/widgets/screen_title.dart';
import 'package:todo_app/src/presentation/view/home/widgets/dismissible_widget.dart';
import 'package:todo_app/src/presentation/view/home/widgets/todo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenHead(headTitle: 'Task List'),
              Expanded(
                child: BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    if (state is TodoStateLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is TodoStateError) {
                      return Center(
                        child: Text(state.failureMessage),
                      );
                    } else if (state is TodoStateLoaded) {
                      return ListView.builder(
                        itemCount: state.todoModelList.length,
                        itemBuilder: (context, index) {
                          final toDoModel = state.todoModelList[index];
                          return DismissibleWidget(
                            valueKey: UniqueKey(),
                            onDismissed: (direction) {
                              context
                                  .read<TodoBloc>()
                                  .add(DeleteTodoEvent(toDoModel));
                            },
                            child: ToDoWidget(
                              toDoModel: toDoModel,
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  '/edit-task',
                                  arguments: toDoModel,
                                );
                              },
                              checkBoxOnchange: (value) {
                                final modifyTodo = toDoModel
                                  ..isTaskCompleted = value ?? false;
                                context
                                    .read<TodoBloc>()
                                    .add(UpdateTodoEvent(modifyTodo));
                              },
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text('unexpected error occurred'),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-task');
        },
        label: const Text('Add New Task'),
      ),
    );
  }
}
