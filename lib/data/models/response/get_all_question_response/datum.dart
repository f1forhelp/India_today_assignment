import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  String? name;
  String? description;
  int? price;
  List<String>? suggestions;

  Datum({
    this.id,
    this.name,
    this.description,
    this.price,
    this.suggestions,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
