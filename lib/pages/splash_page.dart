import 'package:app_movil_city/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final String _data = "AppMobile City";
  final String _version = "Ver 1.0.0";

  void initState(){
   _closeSplashPage();
   super.initState();
 }

  Future<void> _closeSplashPage() async {
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/paisaje-urbano-logo.png')),
              const SizedBox(
                height: 16.0,
              ),
              Text('$_data', style: Theme.of(context).textTheme.headline5,),
              const SizedBox(
                height: 16.0,
              ),
              Text('$_version', style: Theme.of(context).textTheme.headline6,),
            ],
          ),
        ),
      ),
    );
  }
}
