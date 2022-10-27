import 'package:app_movil_city/pages/home_page.dart';
import 'package:flutter/material.dart';

class PoiPage extends StatefulWidget {
  const PoiPage({Key? key}) : super(key: key);

  @override
  State<PoiPage> createState() => _PoiPageState();
}

class _PoiPageState extends State<PoiPage> {
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
                Text('Bogotá DC', style: Theme.of(context).textTheme.headline3,),
                const SizedBox(
                  height: 16.0,
                ),
                Image(image: AssetImage('assets/images/Bogotá-vista-1024x512.png')),
                const SizedBox(
                  height: 16.0,
                ),
                Text('Información General', style: Theme.of(context).textTheme.headline5,),
                const SizedBox(
                  height: 16.0,
                ),
                Text('Bogotá esta al norte de Sur América, en el centro geográfico del país, en el borde oriental de la Sabana de Bogotá, la altiplanicie más alta de los Andes colombianos, cuya altura en promedio es de 2.600 metros sobre el nivel medio del mar, está situada Bogotá, la capital de la República de Colombia. Bogotá es conocida como destino turístico internacional, al ocupar el puesto 21 de 53 escogidos, según el diario The New York Times.228​ Es a su vez el principal destino para extranjeros que visitan Colombia, con el 52 % de los visitantes internacionales. Lugares turísticos importantes de Bogotá son el Jardín Botánico José Celestino Mutis, el Museo del Oro, el Puente Jenny Garzón, la Quinta de Bolívar, el Observatorio Nacional, el Planetario de Bogotá, Maloka,el Museo de Botero, la plaza de Bolívar, el mirador de la Torre Colpatria así como el Mirador de La Calera, el Monumento de Banderas a Las Américas (al lado de la estación Banderas de TransMilenio) y La Candelaria, localidad que es patrimonio y Bien de Interés Cultural de Carácter Nacional. Además, la ciudad cuenta con distintos parques de atracciones mecánicas como: Salitre Mágico y Mundo Aventura.', style: Theme.of(context).textTheme.headline6,),
                Text('En Bogotá hay variedad en oferta de alojamiento que oscila entre posadas para mochileros y hoteles cinco estrellas. La oferta de hoteles en el centro histórico de La Candelaria y sus zonas aledañas, se halla dirigida a un público amante de la cultura y las artes. Los hoteles ubicados cerca a Ciudad Salitre se hallan dirigidos a los visitantes que hacen escalas cortas en Bogotá o necesitan la cercanía al Aeropuerto Internacional El Dorado. En cambio, los hoteles ubicados hacia el norte de la ciudad, están enfocados hacia un turismo de negocios, compras o placer. La ciudad cuenta con el Tren Turístico de la Sabana de Bogotá que hace recorridos los fines de semana y festivos desde centro de Bogotá hasta el Parque Jaime Duque en Tocancipá, Zipaquirá y en ocasiones, hasta Nemocón.', style: Theme.of(context).textTheme.headline6,),
                const SizedBox(
                  height: 16.0,
                ),
                Text('Clima', style: Theme.of(context).textTheme.headline5,),
                const SizedBox(
                  height: 16.0,
                ),
                Text('Bogotá no cuenta con estaciones y tiene un clima homogéneo durante todo el año con temperatura media de 14°C (57°F).', style: Theme.of(context).textTheme.headline6,),
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
