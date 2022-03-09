// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'registros_clinicos.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegistrosClinicos _$RegistrosClinicosFromJson(Map<String, dynamic> json) {
  return _RegistrosClinicos.fromJson(json);
}

/// @nodoc
class _$RegistrosClinicosTearOff {
  const _$RegistrosClinicosTearOff();

  _RegistrosClinicos call({required List<RegistroClinico> item}) {
    return _RegistrosClinicos(
      item: item,
    );
  }

  RegistrosClinicos fromJson(Map<String, Object?> json) {
    return RegistrosClinicos.fromJson(json);
  }
}

/// @nodoc
const $RegistrosClinicos = _$RegistrosClinicosTearOff();

/// @nodoc
mixin _$RegistrosClinicos {
  List<RegistroClinico> get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistrosClinicosCopyWith<RegistrosClinicos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrosClinicosCopyWith<$Res> {
  factory $RegistrosClinicosCopyWith(
          RegistrosClinicos value, $Res Function(RegistrosClinicos) then) =
      _$RegistrosClinicosCopyWithImpl<$Res>;
  $Res call({List<RegistroClinico> item});
}

/// @nodoc
class _$RegistrosClinicosCopyWithImpl<$Res>
    implements $RegistrosClinicosCopyWith<$Res> {
  _$RegistrosClinicosCopyWithImpl(this._value, this._then);

  final RegistrosClinicos _value;
  // ignore: unused_field
  final $Res Function(RegistrosClinicos) _then;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<RegistroClinico>,
    ));
  }
}

/// @nodoc
abstract class _$RegistrosClinicosCopyWith<$Res>
    implements $RegistrosClinicosCopyWith<$Res> {
  factory _$RegistrosClinicosCopyWith(
          _RegistrosClinicos value, $Res Function(_RegistrosClinicos) then) =
      __$RegistrosClinicosCopyWithImpl<$Res>;
  @override
  $Res call({List<RegistroClinico> item});
}

/// @nodoc
class __$RegistrosClinicosCopyWithImpl<$Res>
    extends _$RegistrosClinicosCopyWithImpl<$Res>
    implements _$RegistrosClinicosCopyWith<$Res> {
  __$RegistrosClinicosCopyWithImpl(
      _RegistrosClinicos _value, $Res Function(_RegistrosClinicos) _then)
      : super(_value, (v) => _then(v as _RegistrosClinicos));

  @override
  _RegistrosClinicos get _value => super._value as _RegistrosClinicos;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_RegistrosClinicos(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<RegistroClinico>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_RegistrosClinicos implements _RegistrosClinicos {
  const _$_RegistrosClinicos({required this.item});

  factory _$_RegistrosClinicos.fromJson(Map<String, dynamic> json) =>
      _$$_RegistrosClinicosFromJson(json);

  @override
  final List<RegistroClinico> item;

  @override
  String toString() {
    return 'RegistrosClinicos(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegistrosClinicos &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$RegistrosClinicosCopyWith<_RegistrosClinicos> get copyWith =>
      __$RegistrosClinicosCopyWithImpl<_RegistrosClinicos>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegistrosClinicosToJson(this);
  }
}

abstract class _RegistrosClinicos implements RegistrosClinicos {
  const factory _RegistrosClinicos({required List<RegistroClinico> item}) =
      _$_RegistrosClinicos;

  factory _RegistrosClinicos.fromJson(Map<String, dynamic> json) =
      _$_RegistrosClinicos.fromJson;

  @override
  List<RegistroClinico> get item;
  @override
  @JsonKey(ignore: true)
  _$RegistrosClinicosCopyWith<_RegistrosClinicos> get copyWith =>
      throw _privateConstructorUsedError;
}
