import 'package:flutter/material.dart';

import '../presentation/features/tasks/tasks_screen.dart';

class Routes {
  static const tasks = '/tasks';
}

final Map<String, WidgetBuilder> routes = {
  Routes.tasks: (context) => const TasksScreen(),
};
