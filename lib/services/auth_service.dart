// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/user_provider.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../utils/config.dart';
import '../utils/utils.dart';

class AuthService {
  void loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse(login),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {"Content-Type": "application/json"},
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          await prefs.setString('token', jsonDecode(res.body)['token']);
          navigator.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false,
          );
        },
      );
      print('result : ${res.body}');
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signOut({required BuildContext context}) async {
    try {
      final navigator = Navigator.of(context);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var myToken = prefs.getString('token');
      if (myToken != null) {
        http.Response res = await http.post(
          Uri.parse(logout),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            HttpHeaders.authorizationHeader: myToken,
          },
        );
        httpErrorHandle(
            response: res,
            context: context,
            onSuccess: () async {
              showSnackBar(context, 'Logged Out');
              prefs.setString('token', '');
              navigator.pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false,
              );
            });
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  getUserData(BuildContext context) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var myToken = prefs.getString('token');
      http.Response res = await http.get(
          Uri.parse(userData),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            HttpHeaders.authorizationHeader: myToken!,
          },
        );
        httpErrorHandle(
            response: res,
            context: context,
            onSuccess: () async {
              userProvider.setUser(res.body);
              userProvider.user.token = prefs.getString('token')!;
            });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
