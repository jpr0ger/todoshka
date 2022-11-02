import 'package:hive/hive.dart';
import 'package:todoshka/data/hive/adapters/task_dto.dart';

import '../data/hive/adapters/topic_dto.dart';

const String tasksDB = 'tasks_db';
const String topicsDB = 'topics_db';

Future<void> initHive(HiveInterface hive) async {
  hive.registerAdapter(TaskDtoAdapter());
  hive.registerAdapter(TopicDtoAdapter());

  await hive.openBox<TaskDto>(tasksDB);
  await hive.openBox<TopicDto>(topicsDB);
}
