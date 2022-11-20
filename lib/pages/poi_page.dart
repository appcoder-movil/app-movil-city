import 'package:app_movil_city/models/local_favorite.dart';
import 'package:app_movil_city/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../boxes.dart';
import '../models/poi.dart';

class PoiPage extends StatefulWidget {
  final Poi poiSeleccionado;
  const PoiPage(this.poiSeleccionado, {Key? key}) : super(key: key);
  //const PoiPage(this.poiSeleccionado);

  @override
  State<PoiPage> createState() => _PoiPageState();
}

class _PoiPageState extends State<PoiPage> {

  var isFavorite = false;

  @override
  void initState(){
    print('===========> Leyendo la base de datos!!!');
    _getLocalFavorite();
    super.initState();
  }

  void _getLocalFavorite(){
    final box = Boxes.getFavoritesBox();
    box.values.forEach((element) {
      print('===========> element.id ${element.id}');
      print('===========> widget.poiSeleccionado.id ${widget.poiSeleccionado.id}');
      if(element.id == widget.poiSeleccionado.id){
        isFavorite = true;
      }
    });
  }

  void _onFavoriteButtonClicked() async {
    var localFavorite = LocalFavorite()
      ..id = widget.poiSeleccionado.id
      ..nombre = widget.poiSeleccionado.nombre
      ..puntuacion = widget.poiSeleccionado.puntuacion
      ..foto = widget.poiSeleccionado.foto;


    final box = Boxes.getFavoritesBox();
    //box.add(localFavorite);

    if(isFavorite){
      box.delete(localFavorite.id);
      print('=========> Se ha desmarcado este POI como FAVORITO!!!! (${localFavorite.id})');
    } else {
      box.put(localFavorite.id, localFavorite);
      print('=========> Se ha marcado este POI como FAVORITO!!!! (${localFavorite.id}');
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                Text(widget.poiSeleccionado.nombre, style: Theme.of(context).textTheme.headline3,),
                const SizedBox(
                  height: 16.0,
                ),
                Image(image: AssetImage(widget.poiSeleccionado.foto)),
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
                Text(widget.poiSeleccionado.descripcion, style: Theme.of(context).textTheme.headline6,),
                const SizedBox(
                  height: 16.0,
                ),
                Text('Puntuación', style: Theme.of(context).textTheme.headline5,),
                const SizedBox(
                  height: 16.0,
                ),
                Text(widget.poiSeleccionado.puntuacion, style: Theme.of(context).textTheme.headline6,),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Text('Regresar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}