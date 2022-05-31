// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QueryDataAdapter extends TypeAdapter<QueryData> {
  @override
  final int typeId = 0;

  @override
  QueryData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QueryData(
      foundedQuestion: fields[0] as String,
      foundedAnswer: fields[1] as String,
      queryExecuteDateTime: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, QueryData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.foundedQuestion)
      ..writeByte(1)
      ..write(obj.foundedAnswer)
      ..writeByte(2)
      ..write(obj.queryExecuteDateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QueryDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
