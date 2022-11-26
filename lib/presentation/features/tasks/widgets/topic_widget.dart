import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/presentation/widgets/dialogs.dart';

import '../../../../domain/cubit/tasks/tasks_cubit.dart';
import '../../../../domain/models/task.dart';
import '../../../../domain/models/topic.dart';

class TopicWidget extends StatefulWidget {
  final Topic topic;

  const TopicWidget({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  State<TopicWidget> createState() => _TopicWidgetState();
}

class _TopicWidgetState extends State<TopicWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TasksCubit>().state;

    final tasks =
        state.tasks.where((element) => element.topicId == widget.topic.id);

    return GestureDetector(
      onLongPress: () =>
          showEditTopicDialog(context: context, topic: widget.topic),
      child: ExpansionPanelList(
        expandedHeaderPadding: const EdgeInsets.all(0),
        elevation: 0,
        expansionCallback: (index, bool isExpanded) {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            canTapOnHeader: true,
            isExpanded: _isExpanded,
            headerBuilder: (BuildContext _, bool isExpanded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Text(widget.topic.text,
                    style: TextStyle(
                        fontSize: 16,
                        color: widget.topic.isArchived
                            ? Colors.grey
                            : Colors.black)),
              );
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  ...tasks
                      .map(
                        (task) => GestureDetector(
                          child: CheckboxListTile(
                            title: Text(
                              task.text,
                              style: TextStyle(
                                  decoration: task.isCompleted
                                      ? TextDecoration.lineThrough
                                      : null),
                            ),
                            value: task.isCompleted,
                            onChanged: (value) {
                              context
                                  .read<TasksCubit>()
                                  .checkTask(taskId: task.id);
                            },
                          ),
                          onLongPress: () =>
                              showEditTaskDialog(context: context, task: task),
                        ),
                      )
                      .toList(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: IconButton(
                          onPressed: () => showCreateNewTaskDialog(
                              context: context, topicId: widget.topic.id),
                          icon: const Icon(CupertinoIcons.add),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showCreateNewTaskDialog({
    required BuildContext context,
    required String topicId,
  }) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          final controller = TextEditingController();

          return AlertDialog(
            title: const Text('Новая задача'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller,
                  autofocus: true,
                  maxLines: 2,
                  keyboardType: TextInputType.text,
                  onEditingComplete: () {
                    context
                        .read<TasksCubit>()
                        .addTask(text: controller.text, topicId: topicId);
                    Navigator.pop(context);
                    setState(() {});
                  },
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  context
                      .read<TasksCubit>()
                      .addTask(text: controller.text, topicId: topicId);
                  Navigator.pop(context);
                  setState(() {});
                },
                child: const Text('Создать'),
              ),
            ],
          );
        });
  }

  void showEditTaskDialog({
    required BuildContext context,
    required Task task,
  }) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          final controller = TextEditingController();

          controller.text = task.text;

          return AlertDialog(
            title: const Text('Изменить задачу'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller,
                  autofocus: true,
                  maxLines: 2,
                  keyboardType: TextInputType.text,
                  onEditingComplete: () {
                    context.read<TasksCubit>().editTask(
                        newTask: task.copyWith(text: controller.text));
                    Navigator.pop(context);
                    setState(() {});
                  },
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Изменить'),
                onPressed: () {
                  context
                      .read<TasksCubit>()
                      .editTask(newTask: task.copyWith(text: controller.text));
                  Navigator.pop(context);
                  setState(() {});
                },
              ),
              TextButton(
                child:
                    Text('Удалить', style: TextStyle(color: Colors.red[200])),
                onPressed: () {
                  context.read<TasksCubit>().removeTask(taskId: task.id);
                  Navigator.pop(context);
                  setState(() {});
                },
              ),
            ],
          );
        });
  }
}
