import 'dart:convert';

class CityResponse {
  List<City> cities;

  CityResponse({
    this.cities,
  });

  factory CityResponse.fromRawJson(String str) =>
      CityResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
        cities: json["cities"] == null
            ? null
            : List<City>.from(json["cities"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cities": cities == null
            ? null
            : List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class City {
  int id;
  String name;

  City({
    this.id,
    this.name,
  });

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
