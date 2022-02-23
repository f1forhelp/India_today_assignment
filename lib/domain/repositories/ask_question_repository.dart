import 'package:india_today_demo/utils/network/api_result.dart';

abstract class AskQuestionRepository {
  Future<ApiResult> getAllQuestion();
}
