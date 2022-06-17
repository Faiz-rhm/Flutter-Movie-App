
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ProductionCompany.freezed.dart';
part 'ProductionCompany.g.dart';

@freezed
class ProductionCompany with _$ProductionCompany{
  factory ProductionCompany({
    required int id,
    String? logo_path,
    required String name,
    required String origin_country
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);
}
