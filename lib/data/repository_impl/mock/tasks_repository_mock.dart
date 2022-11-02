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
}
