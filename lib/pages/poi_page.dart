import 'package:app_movil_city/models/local_favorite.dart';
import 'package:flutter/material.dart';

import '../boxes.dart';
import '../models/poi.dart';

class PoiPage extends StatefulWidget {
  final Poi poiSeleccionado;
  PoiPage(this.poiSeleccionado, {Key? key}) : super(key: key);

  @override
  State<PoiPage> createState() => _PoiPageState(poiSeleccionado);
}

class _PoiPageState extends State<PoiPage> {
  var poiSeleccionado;

  var isFavorite = false;

  _PoiPageState(this.poiSeleccionado);

  @override
  void initState(){
    _getLocalFavorite();
    super.initState();
  }

  void _getLocalFavorite(){
    final box = Boxes.getFavoritesBox();
    box.values.forEach((element) {
      if(element.id == poiSeleccionado.id){
        isFavorite = true;
      }
    });
  }

  void _onFavoriteButtonClicked() async {
    var localFavorite = LocalFavorite()
      ..id = poiSeleccionado.id
      ..nombre = poiSeleccionado.nombre
      ..foto = poiSeleccionado.foto
      ..puntuacion = poiSeleccionado.puntuacion
      ..latitud = poiSeleccionado.latitud
      ..longitud = poiSeleccionado.longitud;

    final box = Boxes.getFavoritesBox();

    if(isFavorite){
      box.delete(localFavorite.id);
    } else {
      box.put(localFavorite.id, localFavorite);
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('POI: '+poiSeleccionado.nombre),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                Text('Puntos de Interés (POI)', style: Theme.of(context).textTheme.headline6,),
                const SizedBox(
                  height: 16.0,
                ),
                Text(poiSeleccionado.nombre, style: Theme.of(context).textTheme.headline3,),
                const SizedBox(
                  height: 16.0,
                ),
                Image(image: AssetImage(poiSeleccionado.foto)),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        alignment: Alignment.topRight,
                        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                        color: Colors.red,
                        onPressed: ((){
                          _onFavoriteButtonClicked();
                        }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text('Información General', style: Theme.of(context).textTheme.headline5,),
                const SizedBox(
                  height: 16.0,
                ),
                Text(poiSeleccionado.descripcion, style: Theme.of(context).textTheme.headline6,),
                const SizedBox(
                  height: 16.0,
                ),
                Text('Puntuación: '+poiSeleccionado.puntuacion, style: Theme.of(context).textTheme.headline5,),
                const SizedBox(
                  height: 16.0,
                ),
                Text('Latitud: '+poiSeleccionado.latitud, style: Theme.of(context).textTheme.headline5,),
                const SizedBox(
                  height: 16.0,
                ),
                Text('Longitud: '+poiSeleccionado.longitud, style: Theme.of(context).textTheme.headline5,),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}