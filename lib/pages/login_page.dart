import 'package:app_movil_city/pages/home_page.dart';
import 'package:app_movil_city/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage ({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email=TextEditingController();
  final _password=TextEditingController();
  String _data = "Información del usuario";

  void _onLoginPageButtonClicked(){
    setState(() {
      _data="Información del usuario\nCorreo Elactŕonico: ${_email.text}";
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
                const Image(image: AssetImage('assets/images/paisaje-urbano-logo.png')),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Correo Electrónico'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Contraseña'),
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Text('Iniciar Sesión'),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  child: const Text('Regístrese'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
