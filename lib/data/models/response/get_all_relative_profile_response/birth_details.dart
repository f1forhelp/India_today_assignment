import 'package:json_annotation/json_annotation.dart';

part 'birth_details.g.dart';

@JsonSerializable()
class BirthDetails {
  int? dobYear;
  int? dobMonth;
  int? dobDay;
  int? tobHour;
  int? tobMin;
  String? meridiem;

  BirthDetails({
    this.dobYear,
    this.dobMonth,
    this.dobDay,
    this.tobHour,
    this.tobMin,
    this.meridiem,
  });

  factory BirthDetails.fromJson(Map<String, dynamic> json) {
    return _$BirthDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BirthDetailsToJson(this);
}
