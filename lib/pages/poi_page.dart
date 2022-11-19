import 'package:app_movil_city/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/poi.dart';

class PoiPage extends StatefulWidget {
  final Poi poiSeleccionado;
  const PoiPage(this.poiSeleccionado, {Key? key}) : super(key: key);

  @override
  State<PoiPage> createState() => _PoiPageState();
}

class _PoiPageState extends State<PoiPage> {
  var poiSeleccionado;

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