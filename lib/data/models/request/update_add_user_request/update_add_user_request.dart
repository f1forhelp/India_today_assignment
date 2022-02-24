import 'package:json_annotation/json_annotation.dart';

import 'birth_details.dart';
import 'birth_place.dart';

part 'update_add_user_request.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateAddUserRequest {
  String? uuid;
  String? relation;
  int? relationId;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? fullName;
  String? gender;
  String? dateAndTimeOfBirth;
  BirthDetails? birthDetails;
  BirthPlace? birthPlace;

  UpdateAddUserRequest({
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

  factory UpdateAddUserRequest.fromJson(Map<String, dynamic> json) {
    return _$UpdateAddUserRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateAddUserRequestToJson(this);
}

//-----------Sample Model----------
// {
//     "uuid": "0f443e52-d251-47a9-a996-c3af1ee6c64e",
//     "relation": "Brother",
//     "relationId": 3,
//     "firstName": "Mohit",
//     "middleName": null,
//     "lastName": "Singh",
//     "fullName": "Mohit Kumar",
//     "gender": "MALE",
//     "dateAndTimeOfBirth": "1996-09-18 01:39",
//     "birthDetails": {
//         "dobYear": 1996,
//         "dobMonth": 9,
//         "dobDay": 18,
//         "tobHour": 1,
//         "tobMin": 39,
//         "meridiem": "AM"
//     },
//     "birthPlace": {
//         "placeName": "Kulharia, Bihar, India",
//         "placeId": "ChIJSQWWoQ48kDkRg_d1ANRdMlo"
//     }
// }
