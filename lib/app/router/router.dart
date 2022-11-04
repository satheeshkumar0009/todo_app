import 'package:flutter/material.dart';
import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';
import 'package:todo_app/src/presentation/view/add_todo/add_todo_screen.dart';
import 'package:todo_app/src/presentation/view/edit_todo/edit_todo.dart';
import 'package:todo_app/src/presentation/view/home/dummy.dart';
import 'package:todo_app/src/presentation/view/home/home_screen.dart';
import 'package:todo_app/src/presentation/view/splash_screen/splash_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute<HomeScreen>(
          builder: (context) => const HomeScreen(),
        );
      case '/splash-screen':
        return MaterialPageRoute<DummyView>(
          builder: (context) => DummyView(),
        );
      case '/add-task':
        return MaterialPageRoute<AddToDoScreen>(
          builder: (context) => AddToDoScreen(),
        );
      case '/edit-task':
        if (routeSettings.arguments != null) {
          final toDoModel = routeSettings.arguments! as ToDoModel;
          return MaterialPageRoute<EditTaskScreen>(
            builder: (context) => EditTaskScreen(
              toDoModel: toDoModel,
            ),
          );
        } else {
          return null;
        }

      default:
        return MaterialPageRoute<SplashScreen>(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
