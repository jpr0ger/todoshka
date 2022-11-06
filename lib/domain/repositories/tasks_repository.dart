import 'package:todoshka/domain/models/topic.dart';

import '../models/task.dart';

abstract class TasksRepository {
  Future<List<Task>> getTasks();

  Future<String> createTask({
    required String text,
    required String topicId,
  });

  Future<bool> checkTask(String id);

  Future<bool> removeTask(String id);

  Future<bool> editTask(Task task);

  Future<List<Topic>> getTopics();

  Future<String> createTopic({
    required String text,
  });

  Future<bool> removeTopic(String id);

  Future<bool> editTopic(Topic topic);
}
