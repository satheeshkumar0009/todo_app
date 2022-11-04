import 'package:flutter/material.dart';

class ScreenHead extends StatelessWidget {
  const ScreenHead({super.key, required this.headTitle});
  final String headTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          width: 35,
          image: AssetImage('assets/images/todo_logo.png'),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          headTitle,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(
          height: 3,
          thickness: 2,
          color: Colors.blue,
        ),
      ],
    );
  }
}
