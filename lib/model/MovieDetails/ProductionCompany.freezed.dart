// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ProductionCompany.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) {
  return _ProductionCompany.fromJson(json);
}

/// @nodoc
mixin _$ProductionCompany {
  int get id => throw _privateConstructorUsedError;
  String? get logo_path => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get origin_country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionCompanyCopyWith<ProductionCompany> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionCompanyCopyWith<$Res> {
  factory $ProductionCompanyCopyWith(
          ProductionCompany value, $Res Function(ProductionCompany) then) =
      _$ProductionCompanyCopyWithImpl<$Res>;
  $Res call({int id, String? logo_path, String name, String origin_country});
}

/// @nodoc
class _$ProductionCompanyCopyWithImpl<$Res>
    implements $ProductionCompanyCopyWith<$Res> {
  _$ProductionCompanyCopyWithImpl(this._value, this._then);

  final ProductionCompany _value;
  // ignore: unused_field
  final $Res Function(ProductionCompany) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? logo_path = freezed,
    Object? name = freezed,
    Object? origin_country = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      logo_path: logo_path == freezed
          ? _value.logo_path
          : logo_path // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      origin_country: origin_country == freezed
          ? _value.origin_country
          : origin_country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ProductionCompanyCopyWith<$Res>
    implements $ProductionCompanyCopyWith<$Res> {
  factory _$ProductionCompanyCopyWith(
          _ProductionCompany value, $Res Function(_ProductionCompany) then) =
      __$ProductionCompanyCopyWithImpl<$Res>;
  @override
  $Res call({int id, String? logo_path, String name, String origin_country});
}

/// @nodoc
class __$ProductionCompanyCopyWithImpl<$Res>
    extends _$ProductionCompanyCopyWithImpl<$Res>
    implements _$ProductionCompanyCopyWith<$Res> {
  __$ProductionCompanyCopyWithImpl(
      _ProductionCompany _value, $Res Function(_ProductionCompany) _then)
      : super(_value, (v) => _then(v as _ProductionCompany));

  @override
  _ProductionCompany get _value => super._value as _ProductionCompany;

  @override
  $Res call({
    Object? id = freezed,
    Object? logo_path = freezed,
    Object? name = freezed,
    Object? origin_country = freezed,
  }) {
    return _then(_ProductionCompany(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      logo_path: logo_path == freezed
          ? _value.logo_path
          : logo_path // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      origin_country: origin_country == freezed
          ? _value.origin_country
          : origin_country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductionCompany implements _ProductionCompany {
  _$_ProductionCompany(
      {required this.id,
      this.logo_path,
      required this.name,
      required this.origin_country});

  factory _$_ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$$_ProductionCompanyFromJson(json);

  @override
  final int id;
  @override
  final String? logo_path;
  @override
  final String name;
  @override
  final String origin_country;

  @override
  String toString() {
    return 'ProductionCompany(id: $id, logo_path: $logo_path, name: $name, origin_country: $origin_country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductionCompany &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.logo_path, logo_path) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.origin_country, origin_country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(logo_path),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(origin_country));

  @JsonKey(ignore: true)
  @override
  _$ProductionCompanyCopyWith<_ProductionCompany> get copyWith =>
      __$ProductionCompanyCopyWithImpl<_ProductionCompany>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductionCompanyToJson(this);
  }
}

abstract class _ProductionCompany implements ProductionCompany {
  factory _ProductionCompany(
      {required final int id,
      final String? logo_path,
      required final String name,
      required final String origin_country}) = _$_ProductionCompany;

  factory _ProductionCompany.fromJson(Map<String, dynamic> json) =
      _$_ProductionCompany.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get logo_path => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get origin_country => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductionCompanyCopyWith<_ProductionCompany> get copyWith =>
      throw _privateConstructorUsedError;
}
