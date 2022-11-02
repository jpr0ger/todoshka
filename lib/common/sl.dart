import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:todoshka/data/repository_impl/mock/tasks_repository_mock.dart';
import 'package:todoshka/domain/cubit/tasks_cubit.dart';
import 'package:todoshka/domain/repositories/tasks_repository.dart';

final sl = GetIt.instance;

Future<void> initSl() async {
  //BLOCS
  sl.registerSingleton(() => TasksCubit(sl()));

  //Repositories
  sl.registerLazySingleton<TasksRepository>(() => TasksRepositoryMock());

  //Data sources
  // await Hive.initFlutter();
  sl.registerSingleton<HiveInterface>(Hive);
}
