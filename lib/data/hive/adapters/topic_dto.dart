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
  @HiveField(3)
  final bool? isArchived;

  const TopicDto({
    required this.id,
    required this.text,
    this.isCompleted = false,
    this.isArchived = false,
  });

  @override
  List<Object?> get props => [
        id,
        text,
        isCompleted,
        isArchived,
      ];

  factory TopicDto.fromModel(Topic topic) => TopicDto(
        id: topic.id,
        text: topic.text,
        isCompleted: topic.isCompleted,
        isArchived: topic.isArchived,
      );

  Topic toModel() => Topic(
        id: id,
        text: text,
        isCompleted: isCompleted,
        isArchived: isArchived ?? false,
      );

  TopicDto copyWith({
    String? id,
    String? text,
    bool? isCompleted,
    bool? isArchived,
  }) {
    return TopicDto(
      id: id ?? this.id,
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
      isArchived: isArchived ?? this.isArchived,
    );
  }
}
