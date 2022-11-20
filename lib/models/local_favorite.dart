import 'package:hive/hive.dart';

part 'local_favorite.g.dart';

@HiveType(typeId: 0)
class LocalFavorite extends HiveObject{
  
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  String? nombre;

  @HiveField(2)
  String? puntuacion;

  @HiveField(3)
  String? foto;

}