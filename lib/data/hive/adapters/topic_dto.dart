import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../domain/models/topic.dart';

part 'topic_dto.g.dart';

@HiveType(typeId: 1)
class TopicDto extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final bool isCompleted;

  const TopicDto({
    required this.id,
    required this.text,
    this.isCompleted = false,
  });

  @override
  List<Object?> get props => [
        id,
        text,
        isCompleted,
      ];

  factory TopicDto.fromModel(Topic topic) => TopicDto(
        id: topic.id,
        text: topic.text,
        isCompleted: topic.isCompleted,
      );

  Topic toModel() => Topic(
        id: id,
        text: text,
        isCompleted: isCompleted,
      );

  TopicDto copyWith({
    String? id,
    String? text,
    bool? isCompleted,
  }) {
    return TopicDto(
      id: id ?? this.id,
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
