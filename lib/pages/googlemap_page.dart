import 'dart:async';
import 'package:app_movil_city/models/local_favorite.dart';
import 'package:app_movil_city/models/poi.dart';
import 'package:app_movil_city/pages/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  var poiNombre;
  var poiLatitud;
  var poiLongitud;

  GoogleMapPage(this.poiNombre, this.poiLatitud, this.poiLongitud);

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState(poiNombre, poiLatitud, poiLongitud);
}

class _GoogleMapPageState extends State<GoogleMapPage> {

  var poiNombre;
  var poiLatitud;
  var poiLongitud;

  _GoogleMapPageState(
      this.poiNombre, this.poiLatitud, this.poiLongitud);

  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = Set<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('GoogleMap: ${poiNombre}'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: (){
                setState(() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FavoritesPage()));
                });
              },
            ),
          ]
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(double.parse(poiLatitud), double.parse(poiLongitud)),
          zoom: 9.151926040649414
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller){
          print('========> El mapa ${poiNombre} fue creado!!!');
          _controller.complete(controller);
          _showMarker();
        },
      ),
    );
  }

  void _showMarker(){
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(poiNombre),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(double.parse(poiLatitud), double.parse(poiLongitud)),
      ));
    });
  }
}
