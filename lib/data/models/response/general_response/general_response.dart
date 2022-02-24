import 'package:json_annotation/json_annotation.dart';

part 'general_response.g.dart';

@JsonSerializable()
class GeneralResponse {
  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  String? info;
  String? apiName;

  GeneralResponse({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.info,
    this.apiName,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) {
    return _$GeneralResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GeneralResponseToJson(this);
}

// --------Sample Json -------

// {
//     "httpStatus": "BAD_REQUEST",
//     "httpStatusCode": 400,
//     "success": false,
//     "message": "Relative does not exist",
//     "info": "User relative is deleted for the given uuid.",
//     "apiName": "Delete user relative by uuid."
// }
