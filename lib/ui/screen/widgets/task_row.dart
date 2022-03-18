import 'package:flutter/material.dart';
import 'package:list_test/data/interactor/task_interactor.dart';
import 'package:list_test/data/model/task.dart';

class TaskRow extends StatefulWidget {
  final Task task;
  const TaskRow({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  State<TaskRow> createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  late final _task = widget.task;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        key: UniqueKey(),
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          widget.task.text,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        value: widget.task.isDone,
        onChanged: onChanged);
  }

  void onChanged(bool? value) async {
    _task.isDone = value!;
    await TaskInteractor.updateTask(_task);
    setState(() {});
  }
}