import 'package:app_movil_city/pages/poi_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Puntos de Información (POI)', style: Theme.of(context).textTheme.headline6,),
              const SizedBox(
                height: 16.0,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PoiPage()));
                },
                child: const Text('Bogotá DC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
