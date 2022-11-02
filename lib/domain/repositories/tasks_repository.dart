import 'package:todoshka/domain/models/topic.dart';

import '../models/task.dart';

abstract class TasksRepository {
  Future<List<Task>> getTasks();

  Future<bool> checkTask(String id);

  Future<String> createTask({
    required String text,
    required String topicId,
  });

  Future<List<Topic>> getTopics();

  Future<String> createTopic({
    required String text,
  });
}
