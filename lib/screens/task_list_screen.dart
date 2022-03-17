import 'package:flutter/material.dart';
import 'package:list_test/ui/themes.dart';

import 'widgets/add_list.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final addListener = ValueNotifier<bool>(false);
  final listToShow = List.generate(6, (index) => index.toString());
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_){
        if (controller.text.isNotEmpty) {
      listToShow.add(controller.text);
      listToShow.clear();
      addListener.value = false;
    }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                      onPressed: () {
                        if (!addListener.value) {
                          addListener.value = true;
                        }
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 36,
                      ),
                      label: const SizedBox.shrink(),
                    ),
                  ),
                 
                ],
              ),  Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemCount: 5,
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(listToShow[index],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                      )),
                  
                ],
              ),
            );
          },
        ),
        if (addListener.value) ...[
          if (listToShow.isNotEmpty) const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onEditingComplete: () {
                      listToShow.add(controller.text);
                      controller.clear();
                      //onDeleteAdd();
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'dfdsf',
                    ),
                  ),
                ),
                /* GestureDetector(
                  onTap: onDeleteAdd,
                  child: const Icon(Icons.cancel, size: 25, color: MyColors.red),
                ), */
              ],
            ),
          ),
        ],
      ],
    ),
            ],
          ),
        ),
      ),
    );
  }
}
