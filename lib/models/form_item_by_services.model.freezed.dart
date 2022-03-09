// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'form_item_by_services.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FormItemByServices _$FormItemByServicesFromJson(Map<String, dynamic> json) {
  return _FormItemByServices.fromJson(json);
}

/// @nodoc
class _$FormItemByServicesTearOff {
  const _$FormItemByServicesTearOff();

  _FormItemByServices call(
      {required int id_server_master,
      required String nombre_actividad,
      int? id_movil_master,
      required String json_syncro}) {
    return _FormItemByServices(
      id_server_master: id_server_master,
      nombre_actividad: nombre_actividad,
      id_movil_master: id_movil_master,
      json_syncro: json_syncro,
    );
  }

  FormItemByServices fromJson(Map<String, Object?> json) {
    return FormItemByServices.fromJson(json);
  }
}

/// @nodoc
const $FormItemByServices = _$FormItemByServicesTearOff();

/// @nodoc
mixin _$FormItemByServices {
  int get id_server_master => throw _privateConstructorUsedError;
  String get nombre_actividad => throw _privateConstructorUsedError;
  int? get id_movil_master => throw _privateConstructorUsedError;
  String get json_syncro => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormItemByServicesCopyWith<FormItemByServices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormItemByServicesCopyWith<$Res> {
  factory $FormItemByServicesCopyWith(
          FormItemByServices value, $Res Function(FormItemByServices) then) =
      _$FormItemByServicesCopyWithImpl<$Res>;
  $Res call(
      {int id_server_master,
      String nombre_actividad,
      int? id_movil_master,
      String json_syncro});
}

/// @nodoc
class _$FormItemByServicesCopyWithImpl<$Res>
    implements $FormItemByServicesCopyWith<$Res> {
  _$FormItemByServicesCopyWithImpl(this._value, this._then);

  final FormItemByServices _value;
  // ignore: unused_field
  final $Res Function(FormItemByServices) _then;

  @override
  $Res call({
    Object? id_server_master = freezed,
    Object? nombre_actividad = freezed,
    Object? id_movil_master = freezed,
    Object? json_syncro = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$FormItemByServicesCopyWith<$Res>
    implements $FormItemByServicesCopyWith<$Res> {
  factory _$FormItemByServicesCopyWith(
          _FormItemByServices value, $Res Function(_FormItemByServices) then) =
      __$FormItemByServicesCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id_server_master,
      String nombre_actividad,
      int? id_movil_master,
      String json_syncro});
}

/// @nodoc
class __$FormItemByServicesCopyWithImpl<$Res>
    extends _$FormItemByServicesCopyWithImpl<$Res>
    implements _$FormItemByServicesCopyWith<$Res> {
  __$FormItemByServicesCopyWithImpl(
      _FormItemByServices _value, $Res Function(_FormItemByServices) _then)
      : super(_value, (v) => _then(v as _FormItemByServices));

  @override
  _FormItemByServices get _value => super._value as _FormItemByServices;

  @override
  $Res call({
    Object? id_server_master = freezed,
    Object? nombre_actividad = freezed,
    Object? id_movil_master = freezed,
    Object? json_syncro = freezed,
  }) {
    return _then(_FormItemByServices(
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
@JsonSerializable()
class _$_FormItemByServices implements _FormItemByServices {
  const _$_FormItemByServices(
      {required this.id_server_master,
      required this.nombre_actividad,
      this.id_movil_master,
      required this.json_syncro});

  factory _$_FormItemByServices.fromJson(Map<String, dynamic> json) =>
      _$$_FormItemByServicesFromJson(json);

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
    return 'FormItemByServices(id_server_master: $id_server_master, nombre_actividad: $nombre_actividad, id_movil_master: $id_movil_master, json_syncro: $json_syncro)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormItemByServices &&
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
      const DeepCollectionEquality().hash(id_server_master),
      const DeepCollectionEquality().hash(nombre_actividad),
      const DeepCollectionEquality().hash(id_movil_master),
      const DeepCollectionEquality().hash(json_syncro));

  @JsonKey(ignore: true)
  @override
  _$FormItemByServicesCopyWith<_FormItemByServices> get copyWith =>
      __$FormItemByServicesCopyWithImpl<_FormItemByServices>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FormItemByServicesToJson(this);
  }
}

abstract class _FormItemByServices implements FormItemByServices {
  const factory _FormItemByServices(
      {required int id_server_master,
      required String nombre_actividad,
      int? id_movil_master,
      required String json_syncro}) = _$_FormItemByServices;

  factory _FormItemByServices.fromJson(Map<String, dynamic> json) =
      _$_FormItemByServices.fromJson;

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
  _$FormItemByServicesCopyWith<_FormItemByServices> get copyWith =>
      throw _privateConstructorUsedError;
}
