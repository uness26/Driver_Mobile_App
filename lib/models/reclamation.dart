import 'dart:convert';

class Reclamation {
  final String? id;
  final String type;
  final String? date;
  final String description;
  final String? etat;

  Reclamation({
    this.id,
    required this.type,
    this.date,
    required this.description,
    this.etat,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'date': date,
      'description': description,
      'etat': etat,
    };
  }

  factory Reclamation.fromMap(Map<String, dynamic> map) {
    return Reclamation(
        id: map['_id'] ?? '',
        type: map['type'] ?? '',
        date: map['date'] ?? '',
        description: map['description'] ?? '',
        etat: map['etat'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory Reclamation.fromJson(String source) =>
      Reclamation.fromMap(json.decode(source));
}
