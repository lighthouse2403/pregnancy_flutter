// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baby.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BabyAdapter extends TypeAdapter<Baby> {
  @override
  final int typeId = 1;

  @override
  Baby read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Baby()
      ..motherName = fields[0] as String?
      ..babyName = fields[1] as String?
      ..weight = fields[2] as double?
      ..birthday = fields[3] as DateTime?
      ..days = fields[4] as int?
      ..lastPeriod = fields[5] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, Baby obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.motherName)
      ..writeByte(1)
      ..write(obj.babyName)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.birthday)
      ..writeByte(4)
      ..write(obj.days)
      ..writeByte(5)
      ..write(obj.lastPeriod);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BabyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
