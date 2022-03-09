// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'registro_clinico.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegistroClinico _$RegistroClinicoFromJson(Map<String, dynamic> json) {
  return _RegistroClinico.fromJson(json);
}

/// @nodoc
class _$RegistroClinicoTearOff {
  const _$RegistroClinicoTearOff();

  _RegistroClinico call(
      {required int servicio_id,
      required int id_server_master,
      required String nombre_actividad,
      int? id_movil_master,
      required String json_syncro}) {
    return _RegistroClinico(
      servicio_id: servicio_id,
      id_server_master: id_server_master,
      nombre_actividad: nombre_actividad,
      id_movil_master: id_movil_master,
      json_syncro: json_syncro,
    );
  }

  RegistroClinico fromJson(Map<String, Object?> json) {
    return RegistroClinico.fromJson(json);
  }
}

/// @nodoc
const $RegistroClinico = _$RegistroClinicoTearOff();

/// @nodoc
mixin _$RegistroClinico {
  int get servicio_id => throw _privateConstructorUsedError;
  int get id_server_master => throw _privateConstructorUsedError;
  String get nombre_actividad => throw _privateConstructorUsedError;
  int? get id_movil_master => throw _privateConstructorUsedError;
  String get json_syncro => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistroClinicoCopyWith<RegistroClinico> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistroClinicoCopyWith<$Res> {
  factory $RegistroClinicoCopyWith(
          RegistroClinico value, $Res Function(RegistroClinico) then) =
      _$RegistroClinicoCopyWithImpl<$Res>;
  $Res call(
      {int servicio_id,
      int id_server_master,
      String nombre_actividad,
      int? id_movil_master,
      String json_syncro});
}

/// @nodoc
class _$RegistroClinicoCopyWithImpl<$Res>
    implements $RegistroClinicoCopyWith<$Res> {
  _$RegistroClinicoCopyWithImpl(this._value, this._then);

  final RegistroClinico _value;
  // ignore: unused_field
  final $Res Function(RegistroClinico) _then;

  @override
  $Res call({
    Object? servicio_id = freezed,
    Object? id_server_master = freezed,
    Object? nombre_actividad = freezed,
    Object? id_movil_master = freezed,
    Object? json_syncro = freezed,
  }) {
    return _then(_value.copyWith(
      servicio_id: servicio_id == freezed
          ? _value.servicio_id
          : servicio_id // ignore: cast_nullable_to_non_nullable
              as int,
      id_server_master: id_server_master == freezed
          ? _value.id_server_master
          : id_server_master // ignore: cast_nullable_to_non_nullable
              as int,
      nombre_actividad: nombre_actividad == freezed
          ? _value.nombre_actividad
          : nombre_actividad // ignore: cast_nullable_to_non_nullable
              as String,
      id_movil_master: id_movil_master == freezed
          ? _value.id_movil_master
          : id_movil_master // ignore: cast_nullable_to_non_nullable
              as int?,
      json_syncro: json_syncro == freezed
          ? _value.json_syncro
          : json_syncro // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RegistroClinicoCopyWith<$Res>
    implements $RegistroClinicoCopyWith<$Res> {
  factory _$RegistroClinicoCopyWith(
          _RegistroClinico value, $Res Function(_RegistroClinico) then) =
      __$RegistroClinicoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int servicio_id,
      int id_server_master,
      String nombre_actividad,
      int? id_movil_master,
      String json_syncro});
}

/// @nodoc
class __$RegistroClinicoCopyWithImpl<$Res>
    extends _$RegistroClinicoCopyWithImpl<$Res>
    implements _$RegistroClinicoCopyWith<$Res> {
  __$RegistroClinicoCopyWithImpl(
      _RegistroClinico _value, $Res Function(_RegistroClinico) _then)
      : super(_value, (v) => _then(v as _RegistroClinico));

  @override
  _RegistroClinico get _value => super._value as _RegistroClinico;

  @override
  $Res call({
    Object? servicio_id = freezed,
    Object? id_server_master = freezed,
    Object? nombre_actividad = freezed,
    Object? id_movil_master = freezed,
    Object? json_syncro = freezed,
  }) {
    return _then(_RegistroClinico(
      servicio_id: servicio_id == freezed
          ? _value.servicio_id
          : servicio_id // ignore: cast_nullable_to_non_nullable
              as int,
      id_server_master: id_server_master == freezed
          ? _value.id_server_master
          : id_server_master // ignore: cast_nullable_to_non_nullable
              as int,
      nombre_actividad: nombre_actividad == freezed
          ? _value.nombre_actividad
          : nombre_actividad // ignore: cast_nullable_to_non_nullable
              as String,
      id_movil_master: id_movil_master == freezed
          ? _value.id_movil_master
          : id_movil_master // ignore: cast_nullable_to_non_nullable
              as int?,
      json_syncro: json_syncro == freezed
          ? _value.json_syncro
          : json_syncro // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_RegistroClinico implements _RegistroClinico {
  const _$_RegistroClinico(
      {required this.servicio_id,
      required this.id_server_master,
      required this.nombre_actividad,
      this.id_movil_master,
      required this.json_syncro});

  factory _$_RegistroClinico.fromJson(Map<String, dynamic> json) =>
      _$$_RegistroClinicoFromJson(json);

  @override
  final int servicio_id;
  @override
  final int id_server_master;
  @override
  final String nombre_actividad;
  @override
  final int? id_movil_master;
  @override
  final String json_syncro;

  @override
  String toString() {
    return 'RegistroClinico(servicio_id: $servicio_id, id_server_master: $id_server_master, nombre_actividad: $nombre_actividad, id_movil_master: $id_movil_master, json_syncro: $json_syncro)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegistroClinico &&
            const DeepCollectionEquality()
                .equals(other.servicio_id, servicio_id) &&
            const DeepCollectionEquality()
                .equals(other.id_server_master, id_server_master) &&
            const DeepCollectionEquality()
                .equals(other.nombre_actividad, nombre_actividad) &&
            const DeepCollectionEquality()
                .equals(other.id_movil_master, id_movil_master) &&
            const DeepCollectionEquality()
                .equals(other.json_syncro, json_syncro));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(servicio_id),
      const DeepCollectionEquality().hash(id_server_master),
      const DeepCollectionEquality().hash(nombre_actividad),
      const DeepCollectionEquality().hash(id_movil_master),
      const DeepCollectionEquality().hash(json_syncro));

  @JsonKey(ignore: true)
  @override
  _$RegistroClinicoCopyWith<_RegistroClinico> get copyWith =>
      __$RegistroClinicoCopyWithImpl<_RegistroClinico>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegistroClinicoToJson(this);
  }
}

abstract class _RegistroClinico implements RegistroClinico {
  const factory _RegistroClinico(
      {required int servicio_id,
      required int id_server_master,
      required String nombre_actividad,
      int? id_movil_master,
      required String json_syncro}) = _$_RegistroClinico;

  factory _RegistroClinico.fromJson(Map<String, dynamic> json) =
      _$_RegistroClinico.fromJson;

  @override
  int get servicio_id;
  @override
  int get id_server_master;
  @override
  String get nombre_actividad;
  @override
  int? get id_movil_master;
  @override
  String get json_syncro;
  @override
  @JsonKey(ignore: true)
  _$RegistroClinicoCopyWith<_RegistroClinico> get copyWith =>
      throw _privateConstructorUsedError;
}
