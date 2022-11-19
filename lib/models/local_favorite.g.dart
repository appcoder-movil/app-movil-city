// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_favorite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalFavoriteAdapter extends TypeAdapter<LocalFavorite> {
  @override
  final int typeId = 0;

  @override
  LocalFavorite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalFavorite()
      ..id = fields[0] as String?
      ..nombre = fields[1] as String?
      ..puntuacion = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalFavorite obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.puntuacion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalFavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
