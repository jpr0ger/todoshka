import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/cubit/settings/settings_cubit.dart';
import '../domain/cubit/tasks/tasks_cubit.dart';
import 'sl.dart';

List<BlocProvider> initCubits() {
  return [
    BlocProvider<TasksCubit>(
      create: (_) => TasksCubit(sl())..fetchTopicsAndTasks(),
      lazy: false,
    ),
    BlocProvider<SettingsCubit>(
      create: (_) => SettingsCubit(),
    ),
  ];
}
