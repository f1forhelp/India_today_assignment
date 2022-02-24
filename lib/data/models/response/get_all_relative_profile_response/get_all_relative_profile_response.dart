import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_all_relative_profile_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllRelativeProfileResponse {
  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  String? apiName;
  Data? data;

  GetAllRelativeProfileResponse({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  factory GetAllRelativeProfileResponse.fromJson(Map<String, dynamic> json) {
    return _$GetAllRelativeProfileResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllRelativeProfileResponseToJson(this);
}



//-------------Sample Json --------------

// {
//     "httpStatus": "OK",
//     "httpStatusCode": 200,
//     "success": true,
//     "message": "Successfully fetched relatives for user.",
//     "apiName": "Get all relatives by user.",
//     "data": {
//         "pageNo": 1,
//         "numberOfElements": 4,
//         "pageSize": 10,
//         "totalElements": 4,
//         "totalPages": 1,
//         "allRelatives": [
//             {
//                 "uuid": "cdef81de-5f7f-446f-a7c7-c909085a6b43",
//                 "relation": "Brother",
//                 "relationId": 3,
//                 "firstName": "Mohit",
//                 "middleName": null,
//                 "lastName": "Kumar",
//                 "fullName": "Mohit Kumar",
//                 "gender": "MALE",
//                 "dateAndTimeOfBirth": "1994-08-10T08:30:00",
//                 "birthDetails": {
//                     "dobYear": 1994,
//                     "dobMonth": 8,
//                     "dobDay": 10,
//                     "tobHour": 8,
//                     "tobMin": 30,
//                     "meridiem": "AM"
//                 },
//                 "birthPlace": {
//                     "placeName": "Kulharia, Bihar, India",
//                     "placeId": "ChIJwTa3v_6nkjkRC_b2yajUF_M"
//                 }
//             },
//             {
//                 "uuid": "f8653d77-faa4-4489-997d-638c9afab5ba",
//                 "relation": "Brother",
//                 "relationId": 3,
//                 "firstName": "Name 1",
//                 "middleName": null,
//                 "lastName": "Kumar",
//                 "fullName": "Name 1 Kumar",
//                 "gender": "MALE",
//                 "dateAndTimeOfBirth": "1994-08-10T08:30:00",
//                 "birthDetails": {
//                     "dobYear": 1994,
//                     "dobMonth": 8,
//                     "dobDay": 10,
//                     "tobHour": 8,
//                     "tobMin": 30,
//                     "meridiem": "AM"
//                 },
//                 "birthPlace": {
//                     "placeName": "Kulharia, Bihar, India",
//                     "placeId": "ChIJwTa3v_6nkjkRC_b2yajUF_M"
//                 }
//             },
//             {
//                 "uuid": "dc7ad631-3aab-4a11-9d03-3dc2af9284be",
//                 "relation": "Brother",
//                 "relationId": 3,
//                 "firstName": "Name 2",
//                 "middleName": null,
//                 "lastName": "Kumar",
//                 "fullName": "Name 2 Kumar",
//                 "gender": "MALE",
//                 "dateAndTimeOfBirth": "1994-08-10T08:30:00",
//                 "birthDetails": {
//                     "dobYear": 1994,
//                     "dobMonth": 8,
//                     "dobDay": 10,
//                     "tobHour": 8,
//                     "tobMin": 30,
//                     "meridiem": "AM"
//                 },
//                 "birthPlace": {
//                     "placeName": "Kulharia, Bihar, India",
//                     "placeId": "ChIJwTa3v_6nkjkRC_b2yajUF_M"
//                 }
//             },
//             {
//                 "uuid": "14991729-cbea-4891-b67a-d9a028ba6873",
//                 "relation": "Brother",
//                 "relationId": 3,
//                 "firstName": "Name 3",
//                 "middleName": null,
//                 "lastName": "Kumar",
//                 "fullName": "Name 3 Kumar",
//                 "gender": "MALE",
//                 "dateAndTimeOfBirth": "1994-08-10T08:30:00",
//                 "birthDetails": {
//                     "dobYear": 1994,
//                     "dobMonth": 8,
//                     "dobDay": 10,
//                     "tobHour": 8,
//                     "tobMin": 30,
//                     "meridiem": "AM"
//                 },
//                 "birthPlace": {
//                     "placeName": "Kulharia, Bihar, India",
//                     "placeId": "ChIJwTa3v_6nkjkRC_b2yajUF_M"
//                 }
//             }
//         ]
//     }
// }