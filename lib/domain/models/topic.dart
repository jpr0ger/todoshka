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
}
