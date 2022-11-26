import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cubit/tasks/tasks_cubit.dart';
import '../../domain/models/topic.dart';

void showCreateNewTopicDialog(BuildContext context) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        final controller = TextEditingController();

        return AlertDialog(
          title: const Text('Новая тема'),
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
                  context.read<TasksCubit>().addTopic(controller.text);
                  Navigator.pop(context);
                },
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context.read<TasksCubit>().addTopic(controller.text);
                Navigator.pop(context);
              },
              child: const Text('Создать'),
            ),
          ],
        );
      });
}

void showEditTopicDialog({
  required BuildContext context,
  required Topic topic,
}) {
  showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        final controller = TextEditingController();

        controller.text = topic.text;

        return AlertDialog(
          title: const Text('Изменить тему'),
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
                  context.read<TasksCubit>().editTopic(
                      newTopic: topic.copyWith(text: controller.text));
                  Navigator.pop(context);
                },
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context
                    .read<TasksCubit>()
                    .editTopic(newTopic: topic.copyWith(text: controller.text));
                Navigator.pop(context);
              },
              child: const Text('Изменить'),
            ),
            topic.isArchived
                ? TextButton(
                    onPressed: () {
                      context
                          .read<TasksCubit>()
                          .unarchiveTopic(topicId: topic.id);
                      Navigator.pop(context);
                    },
                    child: const Text('Разархивировать',
                        style: TextStyle(color: Colors.grey)),
                  )
                : TextButton(
                    onPressed: () {
                      context
                          .read<TasksCubit>()
                          .archiveTopic(topicId: topic.id);
                      Navigator.pop(context);
                    },
                    child: const Text('В архив',
                        style: TextStyle(color: Colors.grey)),
                  ),
            TextButton(
              onPressed: () {
                context.read<TasksCubit>().removeTopic(topicId: topic.id);
                Navigator.pop(context);
              },
              child: Text('Удалить', style: TextStyle(color: Colors.red[200])),
            ),
          ],
        );
      });
}
