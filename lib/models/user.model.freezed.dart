// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required int id,
      required String nombre,
      required String primer_apellido,
      required String segundo_apellido,
      required String primer_nombre,
      required String segundo_nombre,
      required String departamento,
      required String municipio,
      required int ordenes_asignadas,
      required String actividades_asignadas,
      required String actividades_realizadas,
      required List<Profile> perfiles}) {
    return _User(
      id: id,
      nombre: nombre,
      primer_apellido: primer_apellido,
      segundo_apellido: segundo_apellido,
      primer_nombre: primer_nombre,
      segundo_nombre: segundo_nombre,
      departamento: departamento,
      municipio: municipio,
      ordenes_asignadas: ordenes_asignadas,
      actividades_asignadas: actividades_asignadas,
      actividades_realizadas: actividades_realizadas,
      perfiles: perfiles,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  String get primer_apellido => throw _privateConstructorUsedError;
  String get segundo_apellido => throw _privateConstructorUsedError;
  String get primer_nombre => throw _privateConstructorUsedError;
  String get segundo_nombre => throw _privateConstructorUsedError;
  String get departamento => throw _privateConstructorUsedError;
  String get municipio => throw _privateConstructorUsedError;
  int get ordenes_asignadas => throw _privateConstructorUsedError;
  String get actividades_asignadas => throw _privateConstructorUsedError;
  String get actividades_realizadas => throw _privateConstructorUsedError;
  List<Profile> get perfiles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String nombre,
      String primer_apellido,
      String segundo_apellido,
      String primer_nombre,
      String segundo_nombre,
      String departamento,
      String municipio,
      int ordenes_asignadas,
      String actividades_asignadas,
      String actividades_realizadas,
      List<Profile> perfiles});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nombre = freezed,
    Object? primer_apellido = freezed,
    Object? segundo_apellido = freezed,
    Object? primer_nombre = freezed,
    Object? segundo_nombre = freezed,
    Object? departamento = freezed,
    Object? municipio = freezed,
    Object? ordenes_asignadas = freezed,
    Object? actividades_asignadas = freezed,
    Object? actividades_realizadas = freezed,
    Object? perfiles = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nombre: nombre == freezed
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      primer_apellido: primer_apellido == freezed
          ? _value.primer_apellido
          : primer_apellido // ignore: cast_nullable_to_non_nullable
              as String,
      segundo_apellido: segundo_apellido == freezed
          ? _value.segundo_apellido
          : segundo_apellido // ignore: cast_nullable_to_non_nullable
              as String,
      primer_nombre: primer_nombre == freezed
          ? _value.primer_nombre
          : primer_nombre // ignore: cast_nullable_to_non_nullable
              as String,
      segundo_nombre: segundo_nombre == freezed
          ? _value.segundo_nombre
          : segundo_nombre // ignore: cast_nullable_to_non_nullable
              as String,
      departamento: departamento == freezed
          ? _value.departamento
          : departamento // ignore: cast_nullable_to_non_nullable
              as String,
      municipio: municipio == freezed
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
      ordenes_asignadas: ordenes_asignadas == freezed
          ? _value.ordenes_asignadas
          : ordenes_asignadas // ignore: cast_nullable_to_non_nullable
              as int,
      actividades_asignadas: actividades_asignadas == freezed
          ? _value.actividades_asignadas
          : actividades_asignadas // ignore: cast_nullable_to_non_nullable
              as String,
      actividades_realizadas: actividades_realizadas == freezed
          ? _value.actividades_realizadas
          : actividades_realizadas // ignore: cast_nullable_to_non_nullable
              as String,
      perfiles: perfiles == freezed
          ? _value.perfiles
          : perfiles // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String nombre,
      String primer_apellido,
      String segundo_apellido,
      String primer_nombre,
      String segundo_nombre,
      String departamento,
      String municipio,
      int ordenes_asignadas,
      String actividades_asignadas,
      String actividades_realizadas,
      List<Profile> perfiles});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? nombre = freezed,
    Object? primer_apellido = freezed,
    Object? segundo_apellido = freezed,
    Object? primer_nombre = freezed,
    Object? segundo_nombre = freezed,
    Object? departamento = freezed,
    Object? municipio = freezed,
    Object? ordenes_asignadas = freezed,
    Object? actividades_asignadas = freezed,
    Object? actividades_realizadas = freezed,
    Object? perfiles = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nombre: nombre == freezed
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      primer_apellido: primer_apellido == freezed
          ? _value.primer_apellido
          : primer_apellido // ignore: cast_nullable_to_non_nullable
              as String,
      segundo_apellido: segundo_apellido == freezed
          ? _value.segundo_apellido
          : segundo_apellido // ignore: cast_nullable_to_non_nullable
              as String,
      primer_nombre: primer_nombre == freezed
          ? _value.primer_nombre
          : primer_nombre // ignore: cast_nullable_to_non_nullable
              as String,
      segundo_nombre: segundo_nombre == freezed
          ? _value.segundo_nombre
          : segundo_nombre // ignore: cast_nullable_to_non_nullable
              as String,
      departamento: departamento == freezed
          ? _value.departamento
          : departamento // ignore: cast_nullable_to_non_nullable
              as String,
      municipio: municipio == freezed
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
      ordenes_asignadas: ordenes_asignadas == freezed
          ? _value.ordenes_asignadas
          : ordenes_asignadas // ignore: cast_nullable_to_non_nullable
              as int,
      actividades_asignadas: actividades_asignadas == freezed
          ? _value.actividades_asignadas
          : actividades_asignadas // ignore: cast_nullable_to_non_nullable
              as String,
      actividades_realizadas: actividades_realizadas == freezed
          ? _value.actividades_realizadas
          : actividades_realizadas // ignore: cast_nullable_to_non_nullable
              as String,
      perfiles: perfiles == freezed
          ? _value.perfiles
          : perfiles // ignore: cast_nullable_to_non_nullable
              as List<Profile>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.id,
      required this.nombre,
      required this.primer_apellido,
      required this.segundo_apellido,
      required this.primer_nombre,
      required this.segundo_nombre,
      required this.departamento,
      required this.municipio,
      required this.ordenes_asignadas,
      required this.actividades_asignadas,
      required this.actividades_realizadas,
      required this.perfiles});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int id;
  @override
  final String nombre;
  @override
  final String primer_apellido;
  @override
  final String segundo_apellido;
  @override
  final String primer_nombre;
  @override
  final String segundo_nombre;
  @override
  final String departamento;
  @override
  final String municipio;
  @override
  final int ordenes_asignadas;
  @override
  final String actividades_asignadas;
  @override
  final String actividades_realizadas;
  @override
  final List<Profile> perfiles;

  @override
  String toString() {
    return 'User(id: $id, nombre: $nombre, primer_apellido: $primer_apellido, segundo_apellido: $segundo_apellido, primer_nombre: $primer_nombre, segundo_nombre: $segundo_nombre, departamento: $departamento, municipio: $municipio, ordenes_asignadas: $ordenes_asignadas, actividades_asignadas: $actividades_asignadas, actividades_realizadas: $actividades_realizadas, perfiles: $perfiles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.nombre, nombre) &&
            const DeepCollectionEquality()
                .equals(other.primer_apellido, primer_apellido) &&
            const DeepCollectionEquality()
                .equals(other.segundo_apellido, segundo_apellido) &&
            const DeepCollectionEquality()
                .equals(other.primer_nombre, primer_nombre) &&
            const DeepCollectionEquality()
                .equals(other.segundo_nombre, segundo_nombre) &&
            const DeepCollectionEquality()
                .equals(other.departamento, departamento) &&
            const DeepCollectionEquality().equals(other.municipio, municipio) &&
            const DeepCollectionEquality()
                .equals(other.ordenes_asignadas, ordenes_asignadas) &&
            const DeepCollectionEquality()
                .equals(other.actividades_asignadas, actividades_asignadas) &&
            const DeepCollectionEquality()
                .equals(other.actividades_realizadas, actividades_realizadas) &&
            const DeepCollectionEquality().equals(other.perfiles, perfiles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(nombre),
      const DeepCollectionEquality().hash(primer_apellido),
      const DeepCollectionEquality().hash(segundo_apellido),
      const DeepCollectionEquality().hash(primer_nombre),
      const DeepCollectionEquality().hash(segundo_nombre),
      const DeepCollectionEquality().hash(departamento),
      const DeepCollectionEquality().hash(municipio),
      const DeepCollectionEquality().hash(ordenes_asignadas),
      const DeepCollectionEquality().hash(actividades_asignadas),
      const DeepCollectionEquality().hash(actividades_realizadas),
      const DeepCollectionEquality().hash(perfiles));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {required int id,
      required String nombre,
      required String primer_apellido,
      required String segundo_apellido,
      required String primer_nombre,
      required String segundo_nombre,
      required String departamento,
      required String municipio,
      required int ordenes_asignadas,
      required String actividades_asignadas,
      required String actividades_realizadas,
      required List<Profile> perfiles}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  String get nombre;
  @override
  String get primer_apellido;
  @override
  String get segundo_apellido;
  @override
  String get primer_nombre;
  @override
  String get segundo_nombre;
  @override
  String get departamento;
  @override
  String get municipio;
  @override
  int get ordenes_asignadas;
  @override
  String get actividades_asignadas;
  @override
  String get actividades_realizadas;
  @override
  List<Profile> get perfiles;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
