import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/application/Todo/todo_bloc.dart';
import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';
import 'package:todo_app/src/presentation/core/widgets/primary_button.dart';
import 'package:todo_app/src/presentation/core/widgets/screen_title.dart';
import 'package:todo_app/src/presentation/view/add_todo/widgets/todo_text_field.dart';

class AddToDoScreen extends StatelessWidget {
  AddToDoScreen({super.key});
  final todoTitleController = TextEditingController();
  final todoDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenHead(headTitle: 'Add Task'),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  ToDoTextField(
                    hintText: 'Enter todo Title',
                    minLine: 1,
                    onChanged: (value) {},
                    controller: todoTitleController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ToDoTextField(
                    hintText: 'Enter todo description',
                    minLine: 3,
                    onChanged: (value) {},
                    controller: todoDescController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  PrimaryButton(
                    onPressed: () async {
                      final toDoModel = ToDoModel(
                        title: todoTitleController.text,
                        desc: todoDescController.text,
                        isTaskCompleted: false,
                      );
                      context.read<TodoBloc>().add(AddTodoEvent(toDoModel));
                      todoTitleController.clear();
                      todoDescController.clear();
                      Navigator.pop(context);
                    },
                    btnText: 'Add Todo ',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
