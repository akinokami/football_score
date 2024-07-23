// To parse this JSON data, do
//
//     final factModel = factModelFromJson(jsonString);

import 'dart:convert';

FactModel factModelFromJson(String str) => FactModel.fromJson(json.decode(str));

String factModelToJson(FactModel data) => json.encode(data.toJson());

class FactModel {
  String? id;
  Person? person;
  String? code;
  String? name;
  String? logo;
  String? minute;
  String? minuteExtra;
  List<dynamic>? images;
  String? scheme;
  String? score;
  String? eventName;
  String? eventDetail;

  FactModel({
    this.id,
    this.person,
    this.code,
    this.name,
    this.logo,
    this.minute,
    this.minuteExtra,
    this.images,
    this.scheme,
    this.score,
    this.eventName,
    this.eventDetail,
  });

  factory FactModel.fromJson(Map<String, dynamic> json) => FactModel(
    id: json["id"],
    person: json["person"] == null ? null : Person.fromJson(json["person"]),
    code: json["code"],
    name: json["name"],
    logo: json["logo"],
    minute: json["minute"],
    minuteExtra: json["minute_extra"],
    images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
    scheme: json["scheme"],
    score: json["score"],
    eventName: json["event_name"],
    eventDetail: json["event_detail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "person": person?.toJson(),
    "code": code,
    "name": name,
    "logo": logo,
    "minute": minute,
    "minute_extra": minuteExtra,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "scheme": scheme,
    "score": score,
    "event_name": eventName,
    "event_detail": eventDetail,
  };
}

class Person {
  String? id;
  String? name;
  String? logo;
  String? scheme;

  Person({
    this.id,
    this.name,
    this.logo,
    this.scheme,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    scheme: json["scheme"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "scheme": scheme,
  };
}
