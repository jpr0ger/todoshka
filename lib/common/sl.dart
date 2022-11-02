import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoshka/data/repository_impl/hive/tasks_repository_hive.dart';
import 'package:todoshka/domain/cubit/tasks_cubit.dart';
import 'package:todoshka/domain/repositories/tasks_repository.dart';

final sl = GetIt.instance;

Future<void> initSl() async {
  //BLOCS
  sl.registerSingleton(() => TasksCubit(sl()));

  //Repositories
  sl.registerLazySingleton<TasksRepository>(() => TasksRepositoryHive(sl()));

  //Data sources
  await Hive.initFlutter();
  sl.registerSingleton<HiveInterface>(Hive);
}
