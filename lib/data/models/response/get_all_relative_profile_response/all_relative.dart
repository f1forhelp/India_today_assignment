import 'package:json_annotation/json_annotation.dart';

import 'birth_details.dart';
import 'birth_place.dart';

part 'all_relative.g.dart';

@JsonSerializable(explicitToJson: true)
class AllRelative {
  String? uuid;
  String? relation;
  int? relationId;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? fullName;
  String? gender;
  DateTime? dateAndTimeOfBirth;
  BirthDetails? birthDetails;
  BirthPlace? birthPlace;

  AllRelative({
    this.uuid,
    this.relation,
    this.relationId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.gender,
    this.dateAndTimeOfBirth,
    this.birthDetails,
    this.birthPlace,
  });

  factory AllRelative.fromJson(Map<String, dynamic> json) {
    return _$AllRelativeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllRelativeToJson(this);
}
