import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
  String id;
  String name;
  String lastName;
  DateTime birth;
  bool gender;

  Client({
    this.id,
    this.name,
    this.lastName,
    this.birth,
    this.gender,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        birth: DateTime.parse(json["birth"]),
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        //"id": id,
        "name": name,
        "last_name": lastName,
        "birth":
            "${birth.year.toString().padLeft(4, '0')}-${birth.month.toString().padLeft(2, '0')}-${birth.day.toString().padLeft(2, '0')}",
        "gender": gender,
      };
}
