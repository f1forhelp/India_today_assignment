import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_location_detail_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetLocationDetailResponse {
  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  String? apiName;
  List<Datum>? data;

  GetLocationDetailResponse({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  factory GetLocationDetailResponse.fromJson(Map<String, dynamic> json) {
    return _$GetLocationDetailResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetLocationDetailResponseToJson(this);
}

//---------------Sample Json---------

// {
//     "httpStatus": "OK",
//     "httpStatusCode": 200,
//     "success": true,
//     "message": "Places suggestions fetched successfully.",
//     "apiName": "Get places list.",
//     "data": [
//         {
//             "placeName": "Delhi, India",
//             "placeId": "ChIJL_P_CXMEDTkRw0ZdG-0GVvw"
//         },
//         {
//             "placeName": "Delhi, NY, USA",
//             "placeId": "ChIJVS4Od-R43IkRReeLGEBFcv8"
//         },
//         {
//             "placeName": "Delhi, ON, Canada",
//             "placeId": "ChIJf38LINc1LIgRjQCjD2EW78o"
//         },
//         {
//             "placeName": "Delhi, CA, USA",
//             "placeId": "ChIJeWtf7IQOkYARqIGKfhVoSaU"
//         },
//         {
//             "placeName": "Delhi, LA, USA",
//             "placeId": "ChIJcZQ-y7_dLoYROEhqDgVWSU0"
//         }
//     ]
// }