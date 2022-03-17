import 'package:flutter/material.dart';
import 'package:list_test/screens/task_list_screen.dart';
import 'package:list_test/ui/themes.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      home: const TaskListScreen(),
    );
  }
}