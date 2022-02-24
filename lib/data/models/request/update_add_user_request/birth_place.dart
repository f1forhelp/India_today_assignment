import 'package:json_annotation/json_annotation.dart';

part 'birth_place.g.dart';

@JsonSerializable()
class BirthPlace {
  String? placeName;
  String? placeId;

  BirthPlace({this.placeName, this.placeId});

  factory BirthPlace.fromJson(Map<String, dynamic> json) {
    return _$BirthPlaceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BirthPlaceToJson(this);
}
