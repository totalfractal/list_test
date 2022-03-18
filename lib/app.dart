import 'package:flutter/material.dart';
import 'package:list_test/data/interactor/settings_interactor.dart';
import 'package:list_test/ui/screen/task_list_screen.dart';
import 'package:list_test/ui/themes.dart';
import 'package:provider/provider.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsInteractor(),
      child: Consumer<SettingsInteractor>(
        builder: (_, settings, __) => MaterialApp(
          title: 'Flutter Demo',
          theme: settings.themeData,
          home: const TaskListScreen(),
        ),
      ),
    );
  }
}
