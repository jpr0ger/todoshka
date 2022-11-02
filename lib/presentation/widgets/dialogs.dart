import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cubit/tasks_cubit.dart';

void showBottomSheetForCreateNewTopic(BuildContext context) {
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
                  'Новая тема',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  autofocus: true,
                  controller: controller,
                  maxLines: 2,
                  keyboardType: TextInputType.text,
                  onEditingComplete: () {
                    context.read<TasksCubit>().addTopic(controller.text);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      });
}
