import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/application/Todo/todo_bloc.dart';
import 'package:todo_app/src/presentation/core/widgets/primary_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/images/splash_image.png'),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Image(
                            width: 70,
                            image: AssetImage('assets/images/todo_logo.png'),
                          ),
                          const Text(
                            'What Todo!',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Text(
                            '''
What Todoo!,is a simple app to 
list your task and to, check when finished''',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PrimaryButton(
                            onPressed: () {
                              context.read<TodoBloc>().add(GetTodoListEvent());
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/',
                                (route) => false,
                              );
                            },
                            btnText: 'Get Started ',
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
