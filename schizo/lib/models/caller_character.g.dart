// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caller_character.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CallerCharacterAdapter extends TypeAdapter<CallerCharacter> {
  @override
  final int typeId = 0;

  @override
  CallerCharacter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CallerCharacter(
      name: fields[0] as String,
      phoneNumber: fields[1] as String,
      photo: fields[2] as String,
      ringtone: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CallerCharacter obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.ringtone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CallerCharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
