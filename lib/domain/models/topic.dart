import 'package:equatable/equatable.dart';

class Topic extends Equatable {
  final String id;
  final String text;
  final bool isCompleted;
  final bool isArchived;

  const Topic({
    required this.id,
    required this.text,
    this.isCompleted = false,
    this.isArchived = false,
  });

  @override
  List<Object?> get props => [id, text, isCompleted, isArchived];

  Topic copyWith({
    String? id,
    String? text,
    bool? isCompleted,
    bool? isArchived,
  }) {
    return Topic(
      id: id ?? this.id,
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
      isArchived: isArchived ?? this.isArchived,
    );
  }
}
