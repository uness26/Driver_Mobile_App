import 'package:flutter/material.dart';
import 'package:gestion_de_flotte_mobile_app/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      matricule: '',
      nom: '',
      prenom: '',
      email: '',
      CIN: '',
      tel: '',
      role: '',
      token: '');

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
