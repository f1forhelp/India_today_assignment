//A utility class for handling network related things.
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkUtil {
  //Base Url for pointing to dev , qa or production server.
  String baseUrl = "";
  late _DioClinet _dioClinet;

  NetworkUtil({String? baseUrl}) {
    //If base url is not provided then use the default one.
    this.baseUrl = baseUrl ?? this.baseUrl;
    _dioClinet = _DioClinet(this.baseUrl);
  }

  //Application wide methods for network request.
  Future<Response<T>> get<T>(String url) async {
    return await _dioClinet.get(url);
  }

  Future<Response<T>> post<T>(String url) async {
    return await _dioClinet.post(url);
  }
  //---------------------------------------------

}

//A client for making network calls.
class _DioClinet {
  final String baseUrl;
  late Dio _dio;

  final List<Interceptor> interceptors;

  _DioClinet(this.baseUrl, {Dio? dio, this.interceptors = const []}) {
    _dio = dio ?? _dio;
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 222
      ..options.receiveTimeout = 222
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};

    if (interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    }
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: false));
    }
  }

  Future<Response<T>> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await _dio.get(
      uri,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> post<T>(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await _dio.post(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
