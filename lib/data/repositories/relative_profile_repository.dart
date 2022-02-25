import 'package:india_today_demo/data/models/request/update_add_user_request/update_add_user_request.dart';
import 'package:india_today_demo/data/models/response/general_response/general_response.dart';
import 'package:india_today_demo/data/models/response/get_all_relative_profile_response/get_all_relative_profile_response.dart';
import 'package:india_today_demo/data/models/response/get_location_detail_response/get_location_detail_response.dart';
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

  static Future<ApiResult<GeneralResponse>> addProfile(
      {required UpdateAddUserRequest updateAddUserRequest}) async {
    try {
      var res = await _networkUtil.post(KUrl.addProfile,
          data: updateAddUserRequest.toJson());
      var data = GeneralResponse.fromJson(res.data);

      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(error: NetworkUtil.getDioException(e));
    }
  }

  static Future<ApiResult<GeneralResponse>> updateProfile(
      {required UpdateAddUserRequest updateAddUserRequest,
      required String uuid}) async {
    try {
      var res = await _networkUtil.post(KUrl.updateProfile + uuid,
          data: updateAddUserRequest.toJson());
      var data = GeneralResponse.fromJson(res.data);

      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(error: NetworkUtil.getDioException(e));
    }
  }

  static Future<ApiResult<GetLocationDetailResponse>> getLocationData(
      {required String location}) async {
    try {
      var res = await _networkUtil.get(KUrl.deleteProfile + location);
      var data = GetLocationDetailResponse.fromJson(res.data);

      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(error: NetworkUtil.getDioException(e));
    }
  }
}
