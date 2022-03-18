import 'package:flutter/material.dart';
import 'package:list_test/data/interactor/task_interactor.dart';
import 'package:list_test/data/model/task.dart';
import 'package:list_test/data/repository/task_repository.dart';
import 'package:list_test/ui/async_state_manager.dart';
import 'package:list_test/ui/screen/widgets/task_row.dart';
import 'package:uuid/uuid.dart';

class AddList extends StatefulWidget {
  final bool isAdd;
  final VoidCallback onEditingComplete;
  final TextEditingController textController;
  const AddList({
    required this.isAdd,
    required this.onEditingComplete,
    required this.textController,
    Key? key, 
  }) : super(key: key);

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final _listToShow = <Task>[];

  final _asyncManager = AsyncStateManager();

  @override
  void initState() {
    super.initState();
    _asyncManager.addRequest('init');
    TaskInteractor.getTasks().then((value) {
      _listToShow.addAll(value.reversed);
      setState(() {
        _asyncManager.removeRequest('init');
      });
    }).onError((error, stackTrace) {
      _asyncManager.removeRequest('init');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.isAdd) ...[
          
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.textController,
                  onEditingComplete: _onEditingComplete,
                  autofocus: true,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Input task text...',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.textController.clear();
                },
                child: Icon(Icons.cancel, size: 25, color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
        ],
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: _listToShow.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10,),
            itemBuilder: (BuildContext ctx, int index) {
              return TaskRow(
                task: _listToShow[index],
              );
            },
          ),
        ),
      ],
    );
  }

  void _onEditingComplete() async {
    if (widget.textController.text.isNotEmpty) {
      _asyncManager.addRequest('add');
      final task = Task.fromScratch(id: const Uuid().v4(), text: widget.textController.text, isDone: false);
      var res = await TaskInteractor.addTask(task);
      _asyncManager.removeRequest('add');
      _listToShow.insert(0, task);
      widget.textController.clear();
      setState(() {});
    }
    widget.onEditingComplete();
  }
}
