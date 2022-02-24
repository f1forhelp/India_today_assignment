import 'package:india_today_demo/data/models/response/general_response/general_response.dart';
import 'package:india_today_demo/data/models/response/get_all_relative_profile_response/get_all_relative_profile_response.dart';
import 'package:india_today_demo/utils/constants/k_url.dart';
import 'package:india_today_demo/utils/network/api_result/api_result.dart';
import 'package:india_today_demo/utils/network/network_utils.dart';

class RelativeProfileRepository {
  static final NetworkUtil _networkUtil = NetworkUtil(baseUrl: KUrl.baseUrl);

  static Future<ApiResult<GetAllRelativeProfileResponse>>
      getAllRelativeProfile() async {
    try {
      var res = await _networkUtil.get(KUrl.getAllRelativeProfile);
      var data = GetAllRelativeProfileResponse.fromJson(res.data);

      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(error: NetworkUtil.getDioException(e));
    }
  }

  static Future<ApiResult<GeneralResponse>> deleteProfile(
      {required String uuid}) async {
    try {
      var res = await _networkUtil.post(KUrl.deleteProfile + uuid);
      var data = GeneralResponse.fromJson(res.data);

      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(error: NetworkUtil.getDioException(e));
    }
  }
}
