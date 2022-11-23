import 'package:app_movil_city/pages/favorites_page.dart';
import 'package:app_movil_city/pages/googlemap_page.dart';
import 'package:app_movil_city/pages/login_page.dart';
import 'package:app_movil_city/pages/poi_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/poi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Menu {favorites, logOut}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POI'),
        actions: [
          PopupMenuButton(
            onSelected: (Menu item){
              setState(() {
                print('=========> Creado el Draw!!!');
                if(item==Menu.logOut){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                } else {
                  if(item==Menu.favorites){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FavoritesPage()));
                  }
                }
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem(
                value: Menu.favorites,
                child: Text('Favoritos'),
              ),
              const PopupMenuItem(
                value: Menu.logOut,
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('sitios_turisticos').snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData) return const Text('Loading');
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index){
                QueryDocumentSnapshot poi=snapshot.data!.docs[index];
                print('=========> Creado el objeto desde el box de Hive con el index ${index}!!!');
                return Card(
                  child: ListTile(
                    onTap: (){
                      setState(() {
                        Poi poiSeleccionado = Poi(poi['id'], 'assets/images/'+poi['foto'], poi['nombre'], poi['descripcion'], poi['puntuacion'], poi['latitud'], poi['longitud']);
                        print('=========> Creada la instancia de Poi para pasar a la vista de detalle!!!');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PoiPage(poiSeleccionado)));
                      });
                    },
                    title: Text(poi['nombre']),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
