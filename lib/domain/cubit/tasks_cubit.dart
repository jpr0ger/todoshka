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
    final topicId = DateTime.now().toString();

    final List<Topic> newTopics = [
      Topic(id: topicId, text: text),
      ...state.topics,
    ];

    emit(TasksState.success(tasks: state.tasks, topics: newTopics));
  }

  Future<void> addTask({
    required String text,
    required String topicId,
  }) async {
    final taskId = DateTime.now().toString();

    final newTasks = state.tasks
      ..toList()
      ..insert(0, Task(id: taskId, text: text, topicId: topicId));

    emit(TasksState.success(tasks: newTasks, topics: state.topics));
  }

  Future<void> checkTask({
    required String taskId,
  }) async {
    final newTasks = state.tasks.map((task) {
      return task.id == taskId
          ? task.copyWith(isCompleted: !task.isCompleted)
          : task;
    }).toList();

    emit(TasksState.success(tasks: newTasks, topics: state.topics));
  }
}