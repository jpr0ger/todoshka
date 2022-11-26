import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/presentation/features/tasks/widgets/app_title.dart';
import 'package:todoshka/presentation/features/tasks/widgets/archive_button_widget.dart';
import 'package:todoshka/presentation/features/tasks/widgets/tasks_list.dart';

import '../../../domain/cubit/settings/settings_cubit.dart';
import '../../../domain/cubit/tasks/tasks_cubit.dart';
import '../../widgets/dialogs.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArchiveButtonWidget(),
        title: const AppTitle(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showCreateNewTopicDialog(context),
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
    final tasksState = context.watch<TasksCubit>().state;
    final settingsState = context.watch<SettingsCubit>().state;

    final showArchived = settingsState.showArchivedTopics;

    switch (tasksState.status) {
      case TasksStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case TasksStatus.success:
        return TasksList(
            topics: tasksState.getSortedTopics(showArchived),
            tasks: tasksState.tasks);
      case TasksStatus.loading:
        return const Center(child: CircularProgressIndicator());
      default:
        return const Center(child: Text('Oops something went wrong!'));
    }
  }
}
