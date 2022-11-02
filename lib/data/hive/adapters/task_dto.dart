import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../domain/models/task.dart';

part 'task_dto.g.dart';

@HiveType(typeId: 2)
class TaskDto extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final bool isCompleted;
  @HiveField(3)
  final String topicId;

  const TaskDto({
    required this.id,
    required this.text,
    this.isCompleted = false,
    required this.topicId,
  });

  @override
  List<Object?> get props => [
        id,
        text,
        isCompleted,
        topicId,
      ];

  factory TaskDto.fromModel(Task task) => TaskDto(
        id: task.id,
        text: task.text,
        isCompleted: task.isCompleted,
        topicId: task.topicId,
      );

  Task toModel() => Task(
        id: id,
        text: text,
        isCompleted: isCompleted,
        topicId: topicId,
      );

  TaskDto copyWith({
    String? id,
    String? text,
    bool? isCompleted,
    String? topicId,
  }) {
    return TaskDto(
      id: id ?? this.id,
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
      topicId: topicId ?? this.topicId,
    );
  }
}
