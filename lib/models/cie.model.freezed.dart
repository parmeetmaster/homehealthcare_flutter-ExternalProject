// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cie.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cie _$CieFromJson(Map<String, dynamic> json) {
  return _Cie.fromJson(json);
}

/// @nodoc
class _$CieTearOff {
  const _$CieTearOff();

  _Cie call(
      {required String codigo,
      required String nombre,
      String? fecha_diagnostico,
      required int status}) {
    return _Cie(
      codigo: codigo,
      nombre: nombre,
      fecha_diagnostico: fecha_diagnostico,
      status: status,
    );
  }

  Cie fromJson(Map<String, Object?> json) {
    return Cie.fromJson(json);
  }
}

/// @nodoc
const $Cie = _$CieTearOff();

/// @nodoc
mixin _$Cie {
  String get codigo => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  String? get fecha_diagnostico => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CieCopyWith<Cie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CieCopyWith<$Res> {
  factory $CieCopyWith(Cie value, $Res Function(Cie) then) =
      _$CieCopyWithImpl<$Res>;
  $Res call(
      {String codigo, String nombre, String? fecha_diagnostico, int status});
}

/// @nodoc
class _$CieCopyWithImpl<$Res> implements $CieCopyWith<$Res> {
  _$CieCopyWithImpl(this._value, this._then);

  final Cie _value;
  // ignore: unused_field
  final $Res Function(Cie) _then;

  @override
  $Res call({
    Object? codigo = freezed,
    Object? nombre = freezed,
    Object? fecha_diagnostico = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      codigo: codigo == freezed
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: nombre == freezed
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      fecha_diagnostico: fecha_diagnostico == freezed
          ? _value.fecha_diagnostico
          : fecha_diagnostico // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CieCopyWith<$Res> implements $CieCopyWith<$Res> {
  factory _$CieCopyWith(_Cie value, $Res Function(_Cie) then) =
      __$CieCopyWithImpl<$Res>;
  @override
  $Res call(
      {String codigo, String nombre, String? fecha_diagnostico, int status});
}

/// @nodoc
class __$CieCopyWithImpl<$Res> extends _$CieCopyWithImpl<$Res>
    implements _$CieCopyWith<$Res> {
  __$CieCopyWithImpl(_Cie _value, $Res Function(_Cie) _then)
      : super(_value, (v) => _then(v as _Cie));

  @override
  _Cie get _value => super._value as _Cie;

  @override
  $Res call({
    Object? codigo = freezed,
    Object? nombre = freezed,
    Object? fecha_diagnostico = freezed,
    Object? status = freezed,
  }) {
    return _then(_Cie(
      codigo: codigo == freezed
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: nombre == freezed
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      fecha_diagnostico: fecha_diagnostico == freezed
          ? _value.fecha_diagnostico
          : fecha_diagnostico // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Cie implements _Cie {
  const _$_Cie(
      {required this.codigo,
      required this.nombre,
      this.fecha_diagnostico,
      required this.status});

  factory _$_Cie.fromJson(Map<String, dynamic> json) => _$$_CieFromJson(json);

  @override
  final String codigo;
  @override
  final String nombre;
  @override
  final String? fecha_diagnostico;
  @override
  final int status;

  @override
  String toString() {
    return 'Cie(codigo: $codigo, nombre: $nombre, fecha_diagnostico: $fecha_diagnostico, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Cie &&
            const DeepCollectionEquality().equals(other.codigo, codigo) &&
            const DeepCollectionEquality().equals(other.nombre, nombre) &&
            const DeepCollectionEquality()
                .equals(other.fecha_diagnostico, fecha_diagnostico) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(codigo),
      const DeepCollectionEquality().hash(nombre),
      const DeepCollectionEquality().hash(fecha_diagnostico),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$CieCopyWith<_Cie> get copyWith =>
      __$CieCopyWithImpl<_Cie>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CieToJson(this);
  }
}

abstract class _Cie implements Cie {
  const factory _Cie(
      {required String codigo,
      required String nombre,
      String? fecha_diagnostico,
      required int status}) = _$_Cie;

  factory _Cie.fromJson(Map<String, dynamic> json) = _$_Cie.fromJson;

  @override
  String get codigo;
  @override
  String get nombre;
  @override
  String? get fecha_diagnostico;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$CieCopyWith<_Cie> get copyWith => throw _privateConstructorUsedError;
}
