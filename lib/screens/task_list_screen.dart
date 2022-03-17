import 'package:flutter/material.dart';
import 'package:list_test/ui/themes.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Themes.screenPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Tasks', style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  width: 56,
                  height: 56,
                  child: OutlinedButton.icon(
                    
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 36,),
                    label: const SizedBox.shrink(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
