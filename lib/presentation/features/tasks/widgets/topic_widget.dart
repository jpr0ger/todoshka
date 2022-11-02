import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/cubit/tasks_cubit.dart';
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

    return ExpansionPanelList(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child:
                  Text(widget.topic.text, style: const TextStyle(fontSize: 16)),
            );
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                ...tasks
                    .map((task) => CheckboxListTile(
                          title: Text(task.text),
                          value: task.isCompleted,
                          onChanged: (value) {
                            context
                                .read<TasksCubit>()
                                .checkTask(taskId: task.id);
                          },
                        ))
                    .toList(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: IconButton(
                        onPressed: () => _showBottomSheetForCreateNewTask(
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
    );
  }

  void _showBottomSheetForCreateNewTask({
    required BuildContext context,
    required String topicId,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          final controller = TextEditingController();

          return SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Новая задача',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: controller,
                    maxLines: 3,
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
            ),
          );
        });
  }
}
