import 'package:india_today_demo/data/models/response/get_all_question_response/get_all_question_response.dart';
import 'package:india_today_demo/utils/constants/k_url.dart';
import 'package:india_today_demo/utils/network/network_utils.dart';

import '../../utils/network/api_result/api_result.dart';

class AskQuestionRepository {
  static final NetworkUtil _networkUtil = NetworkUtil(baseUrl: KUrl.baseUrl);

  static Future<ApiResult<GetAllQuestionResponse>> getAllQuestion() async {
    try {
      var res = await _networkUtil.get(KUrl.getAllQuestion);
      var data = GetAllQuestionResponse.fromJson(res.data);
      return ApiResult.success(data: data);
    } catch (e) {
      print(e);
      return ApiResult.failure(error: NetworkUtil.getDioException(e));
    }
  }
}
