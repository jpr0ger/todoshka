import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String text;
  final bool isCompleted;
  final String topicId;

  const Task({
    required this.id,
    required this.text,
    this.isCompleted = false,
    required this.topicId,
  });

  @override
  List<Object?> get props => [id, text, isCompleted, topicId];

  Task copyWith({
    String? id,
    String? text,
    bool? isCompleted,
    String? topicId,
  }) {
    return Task(
      id: id ?? this.id,
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
      topicId: topicId ?? this.topicId,
    );
  }
}
