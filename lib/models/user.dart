import 'dart:convert';

class User {
  final String id;
  final String matricule;
  final String nom;
  final String prenom;
  final String email;
  final String CIN;
  final String tel;
  final String role;
  late  String token;

  User({
    required this.id,
    required this.matricule,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.CIN,
    required this.tel,
    required this.role,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'matricule':matricule,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'CIN': CIN,
      'tel': tel,
      'role': role,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      matricule: map['matricule'] ?? '',
      nom: map['nom'] ?? '',
      prenom: map['prenom'] ?? '',
      email: map['email'] ?? '',
      CIN: map['CIN'] ?? '',
      tel: map['tel'] ?? '',
      role: map['role'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

}
