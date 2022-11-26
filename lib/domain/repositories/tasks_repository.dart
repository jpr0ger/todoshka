import 'package:todoshka/domain/models/topic.dart';

import '../models/task.dart';

abstract class TasksRepository {
  Future<List<Task>> getTasks();

  Future<String> createTask({
    required String text,
    required String topicId,
  });

  Future<bool> checkTask(String taskId);

  Future<bool> removeTask(String taskId);

  Future<bool> editTask(Task task);

  Future<List<Topic>> getTopics();

  Future<String> createTopic({
    required String text,
  });

  Future<bool> removeTopic(String topicId);

  Future<bool> editTopic(Topic topic);

  Future<bool> archiveTopic(String topicId);

  Future<bool> unarchiveTopic(String topicId);
}
