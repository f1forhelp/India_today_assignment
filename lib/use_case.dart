import 'package:equatable/equatable.dart';
import 'package:india_today_demo/utils/network/api_result.dart';

abstract class UseCase<Type, Params> {
  Future<ApiResult> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
