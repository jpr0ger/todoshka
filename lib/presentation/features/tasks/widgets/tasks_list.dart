import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoshka/presentation/features/tasks/widgets/topic_widget.dart';

import '../../../../domain/models/task.dart';
import '../../../../domain/models/topic.dart';

class TasksList extends StatelessWidget {
  final List<Topic> topics;
  final List<Task> tasks;

  const TasksList({
    Key? key,
    required this.topics,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return TopicWidget(
          topic: topics[index],
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
