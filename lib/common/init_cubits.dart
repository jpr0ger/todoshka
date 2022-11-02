import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/cubit/tasks_cubit.dart';
import 'sl.dart';

List<BlocProvider> initCubits() {
  return [
    BlocProvider<TasksCubit>(
      create: (_) => TasksCubit(sl())..fetchTopicsAndTasks(),
      lazy: false,
    )
  ];
}
