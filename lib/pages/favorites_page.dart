import 'package:app_movil_city/boxes.dart';
import 'package:app_movil_city/models/local_favorite.dart';
import 'package:app_movil_city/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Center(
          child:_buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView(){
    return ValueListenableBuilder<Box<LocalFavorite>>(
        valueListenable: Boxes.getFavoritesBox().listenable(),
        builder: (context, box, _){
          final favoriteBox = box.values.toList().cast<LocalFavorite>();
          return ListView.builder(
            itemCount: favoriteBox.length,
            itemBuilder: (BuildContext context, int index){
              final favorite = favoriteBox[index];
              return Card(
                child: ListTile(
                  leading: Image(image: AssetImage(favorite.foto??"No Photo")),
                  title: Text(favorite.nombre??"No Title"),
                  subtitle: Text(favorite.puntuacion??"No Punctuation"),
                  onLongPress: (){
                    setState(() {
                      favorite.delete();
                    });
                  },
                  onTap: (){
                    setState(() {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                    });
                  },
                ),
              );
            },
          );
        }
    );
  }
}
