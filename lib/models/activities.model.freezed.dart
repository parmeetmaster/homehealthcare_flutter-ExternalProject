// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'activities.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Activities _$ActivitiesFromJson(Map<String, dynamic> json) {
  return _Activities.fromJson(json);
}

/// @nodoc
class _$ActivitiesTearOff {
  const _$ActivitiesTearOff();

  _Activities call({required List<ActivitiesItem> item}) {
    return _Activities(
      item: item,
    );
  }

  Activities fromJson(Map<String, Object?> json) {
    return Activities.fromJson(json);
  }
}

/// @nodoc
const $Activities = _$ActivitiesTearOff();

/// @nodoc
mixin _$Activities {
  List<ActivitiesItem> get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivitiesCopyWith<Activities> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivitiesCopyWith<$Res> {
  factory $ActivitiesCopyWith(
          Activities value, $Res Function(Activities) then) =
      _$ActivitiesCopyWithImpl<$Res>;
  $Res call({List<ActivitiesItem> item});
}

/// @nodoc
class _$ActivitiesCopyWithImpl<$Res> implements $ActivitiesCopyWith<$Res> {
  _$ActivitiesCopyWithImpl(this._value, this._then);

  final Activities _value;
  // ignore: unused_field
  final $Res Function(Activities) _then;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<ActivitiesItem>,
    ));
  }
}

/// @nodoc
abstract class _$ActivitiesCopyWith<$Res> implements $ActivitiesCopyWith<$Res> {
  factory _$ActivitiesCopyWith(
          _Activities value, $Res Function(_Activities) then) =
      __$ActivitiesCopyWithImpl<$Res>;
  @override
  $Res call({List<ActivitiesItem> item});
}

/// @nodoc
class __$ActivitiesCopyWithImpl<$Res> extends _$ActivitiesCopyWithImpl<$Res>
    implements _$ActivitiesCopyWith<$Res> {
  __$ActivitiesCopyWithImpl(
      _Activities _value, $Res Function(_Activities) _then)
      : super(_value, (v) => _then(v as _Activities));

  @override
  _Activities get _value => super._value as _Activities;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_Activities(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<ActivitiesItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Activities implements _Activities {
  const _$_Activities({required this.item});

  factory _$_Activities.fromJson(Map<String, dynamic> json) =>
      _$$_ActivitiesFromJson(json);

  @override
  final List<ActivitiesItem> item;

  @override
  String toString() {
    return 'Activities(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Activities &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$ActivitiesCopyWith<_Activities> get copyWith =>
      __$ActivitiesCopyWithImpl<_Activities>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActivitiesToJson(this);
  }
}

abstract class _Activities implements Activities {
  const factory _Activities({required List<ActivitiesItem> item}) =
      _$_Activities;

  factory _Activities.fromJson(Map<String, dynamic> json) =
      _$_Activities.fromJson;

  @override
  List<ActivitiesItem> get item;
  @override
  @JsonKey(ignore: true)
  _$ActivitiesCopyWith<_Activities> get copyWith =>
      throw _privateConstructorUsedError;
}
