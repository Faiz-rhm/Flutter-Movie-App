// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'SpokenLanguage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) {
  return _SpokenLanguage.fromJson(json);
}

/// @nodoc
mixin _$SpokenLanguage {
  String get english_name => throw _privateConstructorUsedError;
  String get iso_639_1 => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpokenLanguageCopyWith<SpokenLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpokenLanguageCopyWith<$Res> {
  factory $SpokenLanguageCopyWith(
          SpokenLanguage value, $Res Function(SpokenLanguage) then) =
      _$SpokenLanguageCopyWithImpl<$Res>;
  $Res call({String english_name, String iso_639_1, String name});
}

/// @nodoc
class _$SpokenLanguageCopyWithImpl<$Res>
    implements $SpokenLanguageCopyWith<$Res> {
  _$SpokenLanguageCopyWithImpl(this._value, this._then);

  final SpokenLanguage _value;
  // ignore: unused_field
  final $Res Function(SpokenLanguage) _then;

  @override
  $Res call({
    Object? english_name = freezed,
    Object? iso_639_1 = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      english_name: english_name == freezed
          ? _value.english_name
          : english_name // ignore: cast_nullable_to_non_nullable
              as String,
      iso_639_1: iso_639_1 == freezed
          ? _value.iso_639_1
          : iso_639_1 // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SpokenLanguageCopyWith<$Res>
    implements $SpokenLanguageCopyWith<$Res> {
  factory _$SpokenLanguageCopyWith(
          _SpokenLanguage value, $Res Function(_SpokenLanguage) then) =
      __$SpokenLanguageCopyWithImpl<$Res>;
  @override
  $Res call({String english_name, String iso_639_1, String name});
}

/// @nodoc
class __$SpokenLanguageCopyWithImpl<$Res>
    extends _$SpokenLanguageCopyWithImpl<$Res>
    implements _$SpokenLanguageCopyWith<$Res> {
  __$SpokenLanguageCopyWithImpl(
      _SpokenLanguage _value, $Res Function(_SpokenLanguage) _then)
      : super(_value, (v) => _then(v as _SpokenLanguage));

  @override
  _SpokenLanguage get _value => super._value as _SpokenLanguage;

  @override
  $Res call({
    Object? english_name = freezed,
    Object? iso_639_1 = freezed,
    Object? name = freezed,
  }) {
    return _then(_SpokenLanguage(
      english_name: english_name == freezed
          ? _value.english_name
          : english_name // ignore: cast_nullable_to_non_nullable
              as String,
      iso_639_1: iso_639_1 == freezed
          ? _value.iso_639_1
          : iso_639_1 // ignore: cast_nullable_to_non_nullable
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
class _$_SpokenLanguage implements _SpokenLanguage {
  _$_SpokenLanguage(
      {required this.english_name,
      required this.iso_639_1,
      required this.name});

  factory _$_SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$$_SpokenLanguageFromJson(json);

  @override
  final String english_name;
  @override
  final String iso_639_1;
  @override
  final String name;

  @override
  String toString() {
    return 'SpokenLanguage(english_name: $english_name, iso_639_1: $iso_639_1, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SpokenLanguage &&
            const DeepCollectionEquality()
                .equals(other.english_name, english_name) &&
            const DeepCollectionEquality().equals(other.iso_639_1, iso_639_1) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(english_name),
      const DeepCollectionEquality().hash(iso_639_1),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$SpokenLanguageCopyWith<_SpokenLanguage> get copyWith =>
      __$SpokenLanguageCopyWithImpl<_SpokenLanguage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpokenLanguageToJson(this);
  }
}

abstract class _SpokenLanguage implements SpokenLanguage {
  factory _SpokenLanguage(
      {required final String english_name,
      required final String iso_639_1,
      required final String name}) = _$_SpokenLanguage;

  factory _SpokenLanguage.fromJson(Map<String, dynamic> json) =
      _$_SpokenLanguage.fromJson;

  @override
  String get english_name => throw _privateConstructorUsedError;
  @override
  String get iso_639_1 => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SpokenLanguageCopyWith<_SpokenLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}
