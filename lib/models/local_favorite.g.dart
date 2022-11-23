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
      ..foto = fields[2] as String?
      ..puntuacion = fields[3] as String?
      ..latitud = fields[4] as String?
      ..longitud = fields[5] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalFavorite obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.foto)
      ..writeByte(3)
      ..write(obj.puntuacion)
      ..writeByte(4)
      ..write(obj.latitud)
      ..writeByte(5)
      ..write(obj.longitud);
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
