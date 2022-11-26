import 'package:todoshka/domain/models/task.dart';
import 'package:todoshka/domain/models/topic.dart';
import 'package:todoshka/domain/repositories/tasks_repository.dart';

class TasksRepositoryMock implements TasksRepository {
  @override
  Future<bool> checkTask(String id) {
    // TODO: implement checkTask
    throw UnimplementedError();
  }

  @override
  Future<String> createTask({required String text, required String topicId}) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<String> createTopic({required String text}) {
    // TODO: implement createTopic
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTasks() async {
    return [];
  }

  @override
  Future<List<Topic>> getTopics() async {
    return [];
  }

  @override
  Future<bool> editTask(Task task) {
    // TODO: implement editTask
    throw UnimplementedError();
  }

  @override
  Future<bool> removeTask(String id) {
    // TODO: implement removeTask
    throw UnimplementedError();
  }

  @override
  Future<bool> editTopic(Topic topic) {
    // TODO: implement editTopic
    throw UnimplementedError();
  }

  @override
  Future<bool> removeTopic(String id) {
    // TODO: implement removeTopic
    throw UnimplementedError();
  }

  @override
  Future<bool> archiveTopic(String topicId) {
    // TODO: implement archiveTopic
    throw UnimplementedError();
  }

  @override
  Future<bool> unarchiveTopic(String topicId) {
    // TODO: implement unarchiveTopic
    throw UnimplementedError();
  }
}
