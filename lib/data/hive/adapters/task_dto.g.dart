// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskDtoAdapter extends TypeAdapter<TaskDto> {
  @override
  final int typeId = 2;

  @override
  TaskDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskDto(
      id: fields[0] as String,
      text: fields[1] as String,
      isCompleted: fields[2] as bool,
      topicId: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TaskDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isCompleted)
      ..writeByte(3)
      ..write(obj.topicId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
