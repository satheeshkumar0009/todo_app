import 'package:flutter/material.dart';
import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';

class ToDoWidget extends StatelessWidget {
  const ToDoWidget({
    super.key,
    required this.toDoModel,
    required this.onTap,
    required this.checkBoxOnchange,
  });
  final ToDoModel toDoModel;
  final Function() onTap;
  final Function(bool?) checkBoxOnchange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Card(
          color: toDoModel.isTaskCompleted ? Colors.white70 : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: toDoModel.isTaskCompleted ? 2 : 5,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  toDoModel.title,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        toDoModel.desc,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Checkbox(
                      value: toDoModel.isTaskCompleted,
                      onChanged: checkBoxOnchange,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
