import 'package:india_today_demo/data/models/response/get_all_question_response/get_all_question_response.dart';
import 'package:india_today_demo/utils/constants/k_url.dart';
import 'package:india_today_demo/utils/network/api_result.dart';
import 'package:india_today_demo/utils/network/network_utils.dart';

class AskQuestionRepositoryImpl {
  static final NetworkUtil _networkUtil = NetworkUtil(baseUrl: KUrl.baseUrl);

  static Future<ApiResult<GetAllQuestionResponse>> getAllQuestion() async {
    try {
      var res =
          await _networkUtil.get<GetAllQuestionResponse>(KUrl.getAllQuestion);
      return ApiResult.success(data: res.data ?? GetAllQuestionResponse());
    } catch (e) {
      return ApiResult.failure(error: NetworkUtil.getDioException(e));
    }
  }
}
