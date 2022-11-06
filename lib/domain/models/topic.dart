import 'package:equatable/equatable.dart';

class Topic extends Equatable {
  final String id;
  final String text;
  final bool isCompleted;

  const Topic({
    required this.id,
    required this.text,
    this.isCompleted = false,
  });

  @override
  List<Object?> get props => [id, text, isCompleted];

  Topic copyWith({
    String? id,
    String? text,
    bool? isCompleted,
  }) {
    return Topic(
      id: id ?? this.id,
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
