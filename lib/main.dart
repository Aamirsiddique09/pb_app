import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pb_app/bloc/task_bloc.dart';
import 'package:pb_app/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<TaskBloc>(
          create: (context) => TaskBloc(),
          dispose: (context, bloc) => bloc.close(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BlocProvider<TaskBloc>(
        create: (context) => context.read<TaskBloc>(),
        child: const HomePage(),
      ),
    );
  }
}
