import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoshka/domain/repositories/tasks_repository.dart';

import '../models/task.dart';
import '../models/topic.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(this.tasksRepository) : super(const TasksState.loading());

  final TasksRepository tasksRepository;

  Future<void> fetchTopicsAndTasks() async {
    try {
      final topics = await tasksRepository.getTopics();
      final tasks = await tasksRepository.getTasks();
      emit(TasksState.success(tasks: tasks, topics: topics));
    } catch (e) {
      emit(TasksState.failure(e.toString()));
    }
  }

  Future<void> addTopic(String text) async {
    final topicId = await tasksRepository.createTopic(text: text);

    final List<Topic> newTopics = [
      ...state.topics,
      Topic(id: topicId, text: text),
    ];

    emit(TasksState.success(tasks: state.tasks, topics: newTopics));
  }

  Future<void> addTask({
    required String text,
    required String topicId,
  }) async {
    final taskId =
        await tasksRepository.createTask(text: text, topicId: topicId);

    final List<Task> newTasks = state.tasks
      ..toList()
      ..add(Task(id: taskId, text: text, topicId: topicId));

    emit(TasksState.success(tasks: newTasks, topics: state.topics));
  }

  Future<void> checkTask({
    required String taskId,
  }) async {
    final result = await tasksRepository.checkTask(taskId);

    if (result) {
      final newTasks = state.tasks.map((task) {
        return task.id == taskId
            ? task.copyWith(isCompleted: !task.isCompleted)
            : task;
      }).toList();

      emit(TasksState.success(tasks: newTasks, topics: state.topics));
    }
  }

  Future<void> removeTask({
    required String taskId,
  }) async {
    final result = await tasksRepository.removeTask(taskId);

    if (result) {
      final newTasks = state.tasks.where((task) => task.id != taskId).toList();

      emit(TasksState.success(tasks: newTasks, topics: state.topics));
    }
  }

  Future<void> editTask({
    required Task newTask,
  }) async {
    final result = await tasksRepository.editTask(newTask);

    if (result) {
      final newTasks = state.tasks.map((task) {
        return task.id == newTask.id ? newTask : task;
      }).toList();

      emit(TasksState.success(tasks: newTasks, topics: state.topics));
    }
  }

  Future<void> editTopic({
    required Topic newTopic,
  }) async {
    final result = await tasksRepository.editTopic(newTopic);

    if (result) {
      final newTopics = state.topics.map((topic) {
        return topic.id == newTopic.id ? newTopic : topic;
      }).toList();

      emit(TasksState.success(tasks: state.tasks, topics: newTopics));
    }
  }

  Future<void> removeTopic({
    required String topicId,
  }) async {
    final result = await tasksRepository.removeTopic(topicId);

    if (result) {
      final newTopics =
          state.topics.where((topic) => topic.id != topicId).toList();
      final newTasks =
          state.tasks.where((task) => task.topicId != topicId).toList();

      emit(TasksState.success(tasks: newTasks, topics: newTopics));
    }
  }
}
