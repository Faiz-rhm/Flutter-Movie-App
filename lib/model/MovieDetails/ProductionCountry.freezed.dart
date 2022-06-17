// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ProductionCountry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) {
  return _ProductionCountry.fromJson(json);
}

/// @nodoc
mixin _$ProductionCountry {
  String get iso_3166_1 => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionCountryCopyWith<ProductionCountry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionCountryCopyWith<$Res> {
  factory $ProductionCountryCopyWith(
          ProductionCountry value, $Res Function(ProductionCountry) then) =
      _$ProductionCountryCopyWithImpl<$Res>;
  $Res call({String iso_3166_1, String name});
}

/// @nodoc
class _$ProductionCountryCopyWithImpl<$Res>
    implements $ProductionCountryCopyWith<$Res> {
  _$ProductionCountryCopyWithImpl(this._value, this._then);

  final ProductionCountry _value;
  // ignore: unused_field
  final $Res Function(ProductionCountry) _then;

  @override
  $Res call({
    Object? iso_3166_1 = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      iso_3166_1: iso_3166_1 == freezed
          ? _value.iso_3166_1
          : iso_3166_1 // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ProductionCountryCopyWith<$Res>
    implements $ProductionCountryCopyWith<$Res> {
  factory _$ProductionCountryCopyWith(
          _ProductionCountry value, $Res Function(_ProductionCountry) then) =
      __$ProductionCountryCopyWithImpl<$Res>;
  @override
  $Res call({String iso_3166_1, String name});
}

/// @nodoc
class __$ProductionCountryCopyWithImpl<$Res>
    extends _$ProductionCountryCopyWithImpl<$Res>
    implements _$ProductionCountryCopyWith<$Res> {
  __$ProductionCountryCopyWithImpl(
      _ProductionCountry _value, $Res Function(_ProductionCountry) _then)
      : super(_value, (v) => _then(v as _ProductionCountry));

  @override
  _ProductionCountry get _value => super._value as _ProductionCountry;

  @override
  $Res call({
    Object? iso_3166_1 = freezed,
    Object? name = freezed,
  }) {
    return _then(_ProductionCountry(
      iso_3166_1: iso_3166_1 == freezed
          ? _value.iso_3166_1
          : iso_3166_1 // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductionCountry implements _ProductionCountry {
  _$_ProductionCountry({required this.iso_3166_1, required this.name});

  factory _$_ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$$_ProductionCountryFromJson(json);

  @override
  final String iso_3166_1;
  @override
  final String name;

  @override
  String toString() {
    return 'ProductionCountry(iso_3166_1: $iso_3166_1, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductionCountry &&
            const DeepCollectionEquality()
                .equals(other.iso_3166_1, iso_3166_1) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(iso_3166_1),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$ProductionCountryCopyWith<_ProductionCountry> get copyWith =>
      __$ProductionCountryCopyWithImpl<_ProductionCountry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductionCountryToJson(this);
  }
}

abstract class _ProductionCountry implements ProductionCountry {
  factory _ProductionCountry(
      {required final String iso_3166_1,
      required final String name}) = _$_ProductionCountry;

  factory _ProductionCountry.fromJson(Map<String, dynamic> json) =
      _$_ProductionCountry.fromJson;

  @override
  String get iso_3166_1 => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductionCountryCopyWith<_ProductionCountry> get copyWith =>
      throw _privateConstructorUsedError;
}
