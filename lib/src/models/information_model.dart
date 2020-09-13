import 'dart:convert';

Information informationFromJson(String str) =>
    Information.fromJson(json.decode(str));

String informationToJson(Information data) => json.encode(data.toJson());

class Information {
  String id;
  double weight;
  double height;
  String bloodType;
  String allergy;
  String disease;

  Information({
    this.id,
    this.weight,
    this.height,
    this.bloodType,
    this.allergy,
    this.disease,
  });

  factory Information.fromJson(Map<String, dynamic> json) => Information(
        id: json["id"],
        weight: json["weight"].toDouble(),
        height: json["height"].toDouble(),
        bloodType: json["blood_type"],
        allergy: json["allergy"],
        disease: json["disease"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weight": weight,
        "height": height,
        "blood_type": bloodType,
        "allergy": allergy,
        "disease": disease,
      };
}
