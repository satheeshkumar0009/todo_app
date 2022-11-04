import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/application/Todo/todo_bloc.dart';
import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';
import 'package:todo_app/src/presentation/core/widgets/primary_button.dart';
import 'package:todo_app/src/presentation/core/widgets/screen_title.dart';
import 'package:todo_app/src/presentation/view/add_todo/widgets/todo_text_field.dart';

class EditTaskScreen extends StatelessWidget {
  EditTaskScreen({super.key, required this.toDoModel});

  final ToDoModel toDoModel;
  final titleContoller = TextEditingController();
  final descContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenHead(headTitle: 'Edit Task'),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  ToDoTextField(
                    hintText: 'Edit task Title',
                    minLine: 1,
                    controller: titleContoller..text = toDoModel.title,
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ToDoTextField(
                    hintText: 'Edit task description',
                    minLine: 3,
                    controller: descContoller..text = toDoModel.desc,
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  PrimaryButton(
                    onPressed: () {
                      toDoModel
                        ..desc = descContoller.text
                        ..title = titleContoller.text;
                      context.read<TodoBloc>().add(UpdateTodoEvent(toDoModel));
                      titleContoller.clear();
                      descContoller.clear();
                      Navigator.pop(context);
                    },
                    btnText: 'Update ',
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
