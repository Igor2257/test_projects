// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_url.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavedUrl _$SavedUrlFromJson(Map<String, dynamic> json) {
  return _SavedUrl.fromJson(json);
}

/// @nodoc
mixin _$SavedUrl {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get url => throw _privateConstructorUsedError;
  @HiveField(2)
  String get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedUrlCopyWith<SavedUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedUrlCopyWith<$Res> {
  factory $SavedUrlCopyWith(SavedUrl value, $Res Function(SavedUrl) then) =
      _$SavedUrlCopyWithImpl<$Res, SavedUrl>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String url,
      @HiveField(2) String data});
}

/// @nodoc
class _$SavedUrlCopyWithImpl<$Res, $Val extends SavedUrl>
    implements $SavedUrlCopyWith<$Res> {
  _$SavedUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedUrlImplCopyWith<$Res>
    implements $SavedUrlCopyWith<$Res> {
  factory _$$SavedUrlImplCopyWith(
          _$SavedUrlImpl value, $Res Function(_$SavedUrlImpl) then) =
      __$$SavedUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String url,
      @HiveField(2) String data});
}

/// @nodoc
class __$$SavedUrlImplCopyWithImpl<$Res>
    extends _$SavedUrlCopyWithImpl<$Res, _$SavedUrlImpl>
    implements _$$SavedUrlImplCopyWith<$Res> {
  __$$SavedUrlImplCopyWithImpl(
      _$SavedUrlImpl _value, $Res Function(_$SavedUrlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? data = null,
  }) {
    return _then(_$SavedUrlImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedUrlImpl implements _SavedUrl {
  _$SavedUrlImpl(
      {@HiveField(0) this.id = "",
      @HiveField(1) this.url = "",
      @HiveField(2) this.data = ""});

  factory _$SavedUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedUrlImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final String id;
  @override
  @JsonKey()
  @HiveField(1)
  final String url;
  @override
  @JsonKey()
  @HiveField(2)
  final String data;

  @override
  String toString() {
    return 'SavedUrl(id: $id, url: $url, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedUrlImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedUrlImplCopyWith<_$SavedUrlImpl> get copyWith =>
      __$$SavedUrlImplCopyWithImpl<_$SavedUrlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedUrlImplToJson(
      this,
    );
  }
}

abstract class _SavedUrl implements SavedUrl {
  factory _SavedUrl(
      {@HiveField(0) final String id,
      @HiveField(1) final String url,
      @HiveField(2) final String data}) = _$SavedUrlImpl;

  factory _SavedUrl.fromJson(Map<String, dynamic> json) =
      _$SavedUrlImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get url;
  @override
  @HiveField(2)
  String get data;
  @override
  @JsonKey(ignore: true)
  _$$SavedUrlImplCopyWith<_$SavedUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
