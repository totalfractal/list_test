import 'package:flutter/material.dart';
import 'package:list_test/data/interactor/settings_interactor.dart';
import 'package:list_test/ui/screen/widgets/add_list.dart';
import 'package:list_test/ui/themes.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final addListener = ValueNotifier<bool>(false);
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) {
        if (addListener.value) {
          FocusManager.instance.primaryFocus?.unfocus();
          if (_textController.text.isEmpty) {
            addListener.value = false;
          }
        }
      },
      child: Scaffold(
        //resizeToAvoidBottomInset: true,
        body: Padding(
          padding: Themes.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.add,
                          size: 36,
                        ),
                      ),
                      label: const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ValueListenableBuilder<bool>(
                  valueListenable: addListener,
                  builder: (_, value, __) => AddList(
                    isAdd: value,
                    onEditingComplete: () => addListener.value = false,
                    textController: _textController,
                  ),
                ),
              ),
              SizedBox(
                width: 56,
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: Provider.of<SettingsInteractor>(context).switchTheme,
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.dark_mode,
                      size: 36,
                    ),
                  ),
                  label: const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
