import 'package:flutter/material.dart';
import 'package:gestion_de_flotte_mobile_app/services/auth_service.dart';
import 'package:gestion_de_flotte_mobile_app/utils/config.dart';
import 'package:gestion_de_flotte_mobile_app/utils/utils.dart';


class LayerThree extends StatefulWidget {
  const LayerThree({Key? key}) : super(key: key);

  @override
  State<LayerThree> createState() => _LayerThreeState();
}

class _LayerThreeState extends State<LayerThree> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final bool _isNotValidate = false;
  final AuthService authService = AuthService();

  void loginUser() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      authService.loginUser(
          context: context,
          email: emailController.text,
          password: passwordController.text);
    } else {
      showSnackBar(context, 'Champ vide');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Form(
        child: Stack(
          children: <Widget>[
            const Positioned(
              left: 59,
              top: 110,
              child: Text(
                'E-mail',
                style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
                left: 59,
                top: 140,
                child: SizedBox(
                  width: 310,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      hintText: 'Enter Email',
                      hintStyle: const TextStyle(color: hintText),
                      errorText: _isNotValidate ? "Enter Proper Info" : null,
                    ),
                  ),
                )),
            const Positioned(
              left: 59,
              top: 210,
              child: Text(
                'Mot de passe',
                style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
                left: 59,
                top: 240,
                child: SizedBox(
                  width: 310,
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      hintText: 'Entrer votre mot de passe',
                      hintStyle: const TextStyle(color: hintText),
                      errorText: _isNotValidate ? "Enter Proper Info" : null,
                    ),
                  ),
                )),
            const Positioned(
                left: 46,
                top: 400,
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 16,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w600),
                )),
            Positioned(
              top: 380,
              right: 40,
              child: Container(
                width: 99,
                height: 35,
                decoration: const BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    loginUser();
                  },
                  child: const Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




