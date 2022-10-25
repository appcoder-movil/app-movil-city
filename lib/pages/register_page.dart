import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage ({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(image: AssetImage('assets/images/paisaje-urbano-logo.png'))
              ],
          ),
        ),
      ),
    );
  }
}
