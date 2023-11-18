import 'package:flutter/material.dart';

import '../layers/layer_one.dart';
import '../layers/layer_three.dart';
import '../layers/layer_two.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var largeur = MediaQuery.of(context).size.width;
    var hauteur = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.indigo,
          body: Stack(
            children: <Widget>[
              Positioned(
                  top: hauteur / 4.36,
                  left: largeur / 12,
                  child: const Text(
                    'Connexion',
                    style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )),
              Positioned(
                  top: hauteur / 3.1,
                  bottom: hauteur / 87,
                  child: const LayerOne()),
              Positioned(
                  top: hauteur / 2.9, bottom: hauteur / 29, child: LayerTwo()),
              Positioned(top: hauteur / 3.5, child: const LayerThree()),
            ],
          ),
        ),
      ),
    );
  }
}
