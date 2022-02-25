import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_all_question_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllQuestionResponse {
  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  String? apiName;
  List<Datum>? data;

  GetAllQuestionResponse({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  factory GetAllQuestionResponse.fromJson(Map<String, dynamic> json) {
    return _$GetAllQuestionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllQuestionResponseToJson(this);
}

//------Sample Json ------

// {
//     "httpStatus": "OK",
//     "httpStatusCode": 200,
//     "success": true,
//     "message": "Question categories fetched successfully.",
//     "apiName": "Get all categories.",
//     "data": [
// {
//     "id": 1,
//     "name": "Self",
//     "description": "",
//     "price": 150.0,
//     "suggestions": [
//         "Which is the right path for me ?",
//         "Where and what is my potential?",
//         "Do people around me like me?",
//         "Which gemstone is suitable for me?",
//         "Does my future hold success?",
//         "What do stars say about my life?"
//     ]
// }
//     ]
// }
