import 'dart:convert';

class Vehicule {
  final String id;
  final String type;
  final String marque;
  final String immatricule;
  final String volume;

  Vehicule({
    required this.id,
    required this.type,
    required this.marque,
    required this.immatricule,
    required this.volume,
  });

  Map<dynamic, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'marque': marque,
      'immatricule': immatricule,
      'volume': volume,
    };
  }

  factory Vehicule.fromMap(Map<dynamic, dynamic> map) {
    return Vehicule(
      id: map['_id'] ?? '',
      type: map['type'] ?? '',
      marque: map['marque'] ?? '',
      immatricule: map['immatricule'] ?? '',
      volume: map['volume'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Vehicule.fromJson(String source) =>
      Vehicule.fromMap(json.decode(source));
}
