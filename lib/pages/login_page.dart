import 'package:app_movil_city/models/user.dart';
import 'package:app_movil_city/pages/home_page.dart';
import 'package:app_movil_city/pages/register_page.dart';
import 'package:app_movil_city/repository/firebase_api.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage ({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email=TextEditingController();
  final _password=TextEditingController();

  User userLoad=User.Empty();

  final FirebaseApi _firebaseApi=FirebaseApi();

  @override

  void initState(){
    //_getUser();
    super.initState();
  }

  _getUser() async {
    //SharedPreferences prefs=await SharedPreferences.getInstance();
    //Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
    //userLoad=User.fromJson(userMap);
  }

  void _onLoginPageButtonClicked(){
    setState(() {
      //_data="Información del usuario\nCorreo Elactŕonico: ${_email.text}";
    });
  }

  void _showMsg(String msg){
    final scaffoldMsg = ScaffoldMessenger.of(context);
    scaffoldMsg.showSnackBar(
      SnackBar(content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffoldMsg.hideCurrentSnackBar),
      ),
    );
  }

  void _validateUser() async {
    if(_email.text.isEmpty || _password.text.isEmpty){
      _showMsg("Correo o contraseña no pueden estar vacíos.");
    } else {
      var result = await _firebaseApi.logInUser(_email.text, _password.text);
      String msg="";
      if(result=='invalid-email'){
        msg='El correo electrónico está mal escrito.';
      } else
      if(result=='user-not-found'){
        msg='El usuario/contraseña no existen.';
      } else
      if(result=='wrong-password'){
        msg='El correo o la contraseña son inválidos.';
      } else
      if(result=='network-request-failed'){
        msg='El servicio de internet/datos está fallando.';
      } else {
        msg = 'Usuario logeado con éxito.';
        _showMsg(msg);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
      _showMsg(msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Login'),
      ),
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
                    _validateUser();
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
