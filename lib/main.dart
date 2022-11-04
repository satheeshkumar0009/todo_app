import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/app/injector/injector.dart';
import 'package:todo_app/app/router/router.dart';
import 'package:todo_app/src/application/Todo/todo_bloc.dart';
import 'package:todo_app/src/domain/core/model/task_model/task_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Injectable initialize
  configDependencies();
  //Hive initialize
  await Hive.initFlutter();
  //Adapter registartion
  if (!Hive.isAdapterRegistered(ToDoModelAdapter().typeId)) {
    Hive.registerAdapter(ToDoModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TodoBloc>(),
      child: MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: '/splash-screen',
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.nunitoSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
    );
  }
}
