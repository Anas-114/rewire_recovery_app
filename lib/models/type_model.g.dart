// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypeModelAdapter extends TypeAdapter<TypeModel> {
  @override
  final int typeId = 1;

  @override
  TypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypeModel(
      title: fields[0] as String,
      type: fields[1] as String,
      progress: (fields[2] as List).cast<ProgressModel>(),
      taskDate: fields[3] as DateTime,
      isDone: fields[4] as bool,
      description: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TypeModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.progress)
      ..writeByte(3)
      ..write(obj.taskDate)
      ..writeByte(4)
      ..write(obj.isDone)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
