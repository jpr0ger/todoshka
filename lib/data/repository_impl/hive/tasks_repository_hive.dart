import 'package:hive/hive.dart';
import 'package:todoshka/domain/models/task.dart';
import 'package:todoshka/domain/models/topic.dart';
import 'package:todoshka/domain/repositories/tasks_repository.dart';

import '../../../common/hive.dart';
import '../../hive/adapters/task_dto.dart';
import '../../hive/adapters/topic_dto.dart';

class TasksRepositoryHive implements TasksRepository {
  final HiveInterface _hive;

  TasksRepositoryHive(this._hive);

  @override
  Future<List<Task>> getTasks() async {
    final box = _hive.box<TaskDto>(tasksDB);
    final tasks = box.values.map((e) => e.toModel()).toList();
    return tasks;
  }

  @override
  Future<List<Topic>> getTopics() async {
    final box = _hive.box<TopicDto>(topicsDB);
    final topics = box.values.map((e) => e.toModel()).toList();
    return topics;
  }

  @override
  Future<String> createTask(
      {required String text, required String topicId}) async {
    final box = _hive.box<TaskDto>(tasksDB);

    final taskId = DateTime.now().toString();

    await box.put(taskId, TaskDto(id: taskId, text: text, topicId: topicId));

    return taskId;
  }

  @override
  Future<bool> checkTask(String taskId) async {
    final box = _hive.box<TaskDto>(tasksDB);

    final taskDto = box.get(taskId);

    if (taskDto != null) {
      await box.put(
          taskId, taskDto.copyWith(isCompleted: !taskDto.isCompleted));

      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String> createTopic({required String text}) async {
    final box = _hive.box<TopicDto>(topicsDB);

    final topicId = DateTime.now().toString();

    await box.put(topicId, TopicDto(id: topicId, text: text));

    return topicId;
  }
}
