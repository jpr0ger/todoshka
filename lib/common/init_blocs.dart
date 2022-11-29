import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/cubit/settings/settings_bloc.dart';
import '../domain/cubit/tasks/tasks_cubit.dart';
import 'sl.dart';

List<BlocProvider> initBlocs() {
  return [
    BlocProvider<TasksCubit>(
      create: (_) => TasksCubit(sl())..fetchTopicsAndTasks(),
      lazy: false,
    ),
    BlocProvider<SettingsBloc>(
      create: (_) => SettingsBloc(),
      lazy: false,
    ),
  ];
}
