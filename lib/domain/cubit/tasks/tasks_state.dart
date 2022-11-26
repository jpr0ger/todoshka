part of 'tasks_cubit.dart';

enum TasksStatus { loading, success, failure }

class TasksState extends Equatable {
  final TasksStatus status;
  final List<Task> tasks;
  final List<Topic> topics;
  final String message;

  @override
  List<Object> get props => [status, tasks, topics, message];

  const TasksState._({
    this.status = TasksStatus.loading,
    this.tasks = const <Task>[],
    this.topics = const <Topic>[],
    this.message = '',
  });

  const TasksState.loading() : this._();

  const TasksState.success({
    required List<Task> tasks,
    required List<Topic> topics,
  }) : this._(
          status: TasksStatus.success,
          tasks: tasks,
          topics: topics,
        );

  const TasksState.failure(String error)
      : this._(
          status: TasksStatus.failure,
          message: error,
        );

  List<Topic> getSortedTopics(bool showArchived) {
    List<Topic> resultTopics = [];

    resultTopics.addAll(topics.where((element) => element.isArchived == false));

    if (showArchived) {
      resultTopics
          .addAll(topics.where((element) => element.isArchived == true));
    }

    return resultTopics;
  }
}
