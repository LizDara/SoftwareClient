import 'dart:convert';

Consultation consultationFromJson(String str) =>
    Consultation.fromJson(json.decode(str));

String consultationToJson(Consultation data) => json.encode(data.toJson());

class Consultation {
  String id;
  DateTime date;
  String description;

  Consultation({
    this.id,
    this.date,
    this.description,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "description": description,
      };
}
