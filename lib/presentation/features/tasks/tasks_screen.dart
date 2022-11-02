import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/presentation/features/tasks/widgets/app_title.dart';
import 'package:todoshka/presentation/features/tasks/widgets/tasks_list.dart';

import '../../../domain/cubit/tasks_cubit.dart';
import '../../widgets/dialogs.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTitle(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showBottomSheetForCreateNewTopic(context),
            icon: const Icon(CupertinoIcons.add),
          )
        ],
      ),
      body: const _ContentBuilder(),
    );
  }
}

class _ContentBuilder extends StatelessWidget {
  const _ContentBuilder({
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
