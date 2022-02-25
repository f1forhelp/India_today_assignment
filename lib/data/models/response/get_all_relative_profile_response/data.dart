import 'package:json_annotation/json_annotation.dart';

import 'all_relative.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  int? pageNo;
  int? numberOfElements;
  int? pageSize;
  int? totalElements;
  int? totalPages;
  List<AllRelative>? allRelatives;

  Data({
    this.pageNo,
    this.numberOfElements,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.allRelatives,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
