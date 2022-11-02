import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/cubit/tasks_cubit.dart';
import '../../../domain/models/task.dart';
import '../../../domain/models/topic.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOшка'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _showBottomSheetForCreateNewTopic(context),
            icon: const Icon(CupertinoIcons.add),
          )
        ],
      ),
      body: const ContentBuilder(),
    );
  }
}

class ContentBuilder extends StatelessWidget {
  const ContentBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TasksCubit>().state;
    switch (state.status) {
      case TasksStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case TasksStatus.success:
        return TasksList(topics: state.topics, tasks: state.tasks);
      case TasksStatus.loading:
        return const Center(child: CircularProgressIndicator());
      default:
        return const Center(child: Text('Oops something went wrong!'));
    }
  }
}

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
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
            leading: Checkbox(value: false, onChanged: (value) {}),
            title: Text(topics[index].text));
      },
      itemCount: topics.length,
    );
  }
}

void _showBottomSheetForCreateNewTopic(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        final controller = TextEditingController();

        return SizedBox(
          height: 400,
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                onEditingComplete: () {
                  context.read<TasksCubit>().addTopic(controller.text);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      });
}
