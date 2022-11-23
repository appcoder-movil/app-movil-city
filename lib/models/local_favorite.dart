import 'package:hive/hive.dart';

part 'local_favorite.g.dart';

@HiveType(typeId: 0)
class LocalFavorite extends HiveObject{
  
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String? nombre;

  @HiveField(2)
  String? foto;

  @HiveField(3)
  String? puntuacion;

  @HiveField(4)
  String? latitud;

  @HiveField(5)
  String? longitud;

}