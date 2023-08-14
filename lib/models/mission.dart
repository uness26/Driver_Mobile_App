import 'dart:convert';

import 'package:gestion_de_flotte_mobile_app/models/vehicule.dart';


class Mission {
  final String? id;
  final String date;
  final String heureDep;
  final String heurArr;
  final String lieuDep;
  final String lieuArr;
  final String etat;
  final Vehicule? vehicule;

  Mission(
      {this.id,
      required this.date,
      required this.heureDep,
      required this.heurArr,
      required this.lieuDep,
      required this.lieuArr,
      required this.etat,
      this.vehicule});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'heureDep': heureDep,
      'heureArr': heurArr,
      'lieuDep': lieuDep,
      'lieuArr': lieuArr,
      'etat': etat,
      'vehicule': vehicule?.toMap()
    };
  }

  factory Mission.fromMap(Map<String, dynamic> map) {
    return Mission(
        id: map["_id"] ?? '',
        date: map["date"] ?? '',
        heureDep: map["heureDep"] ?? '',
        heurArr: map["heurArr"] ?? '',
        lieuDep: map["lieuDep"] ?? '',
        lieuArr: map["lieuArr"] ?? '',
        etat: map["etat"] ?? '---',
        vehicule: Vehicule.fromMap(map["vehicule"] ?? {}));
  }

  String toJson() => json.encode(toMap());

  factory Mission.fromJson(String source) =>
      Mission.fromMap(json.decode(source));
}
