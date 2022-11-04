import 'package:flutter/material.dart';

class ToDoTextField extends StatelessWidget {
  const ToDoTextField({
    super.key,
    required this.hintText,
    required this.minLine,
    this.onChanged,
    this.controller,
  });
  final String hintText;
  final int minLine;
  final Function(String value)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        minLines: minLine,
        controller: controller,
        maxLines: 20,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(5),
        ),
      ),
    );
  }
}
