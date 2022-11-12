import 'package:app_movil_city/models/user.dart';
import 'package:app_movil_city/pages/login_page.dart';
import 'package:app_movil_city/repository/firebase_api.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage ({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final FirebaseApi _firebaseApi=FirebaseApi();

  final _email=TextEditingController();
  final _password=TextEditingController();
  final _confirm_password=TextEditingController();

  void _showMessage(String msg){
    final scaffoldMsg = ScaffoldMessenger.of(context);
    scaffoldMsg.showSnackBar(
      SnackBar(content: Text(msg),
      action: SnackBarAction(
        label: 'Aceptar', onPressed: scaffoldMsg.hideCurrentSnackBar),
      ),
    );
  }

  void _saveUser(User user) async {
    var result=await _firebaseApi.createUser(user);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void _registerUser(User user) async {
    var result=await _firebaseApi.registerUser(user.email, user.password);
    String msg='';
    if(result=='invalid-email'){
      msg='El correo electrónico está mal escrito.';
    } else
    if(result=='weak-password'){
      msg='La contraseña debe tener al menos 6 carácteres alfanuméricos.';
    } else
    if(result=='email-already-in-use'){
      msg='Ya existe una cuenta con ese correo electrónico.';
    }else
    if(result=='network-request-failed'){
      msg='El servicio de internet/datos está fallando.';
    } else {
      msg='Usuario registrado con éxito.';
      user.uid=result;
      _saveUser(user);
    }

    _showMessage(msg);
  }

  void _onRegisterButtonClicked(){
    setState(() {
      if(_password.text == _confirm_password.text){
        var user = User('', _email.text, _password.text);
        //saveUser(user);
        _registerUser(user);
      }else{
        _showMessage('Las contraseñas DEBEN ser iguales.');
      }
    }
    );
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
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _confirm_password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Confirmar Contraseña'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    _onRegisterButtonClicked();
                  },
                  child: const Text('Registrarse'),
                ),
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
