// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'patient.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
class _$PatientTearOff {
  const _$PatientTearOff();

  _Patient call(
      {required int paciente_id,
      required int tipo_identificacionId,
      required String tipo_identificacion,
      required String identificacion,
      required String primer_nombre,
      required String primer_apellido,
      required String segundo_nombre,
      required String segundo_apellido,
      required String nombre,
      required String fecha_nacimiento,
      required int edad,
      required String telefono,
      required String celular,
      required String departamento,
      required String municipio,
      required String barrio,
      required String direccion,
      required String eps,
      required double geo_lat,
      required double geo_lng,
      required List<Cie> cie}) {
    return _Patient(
      paciente_id: paciente_id,
      tipo_identificacionId: tipo_identificacionId,
      tipo_identificacion: tipo_identificacion,
      identificacion: identificacion,
      primer_nombre: primer_nombre,
      primer_apellido: primer_apellido,
      segundo_nombre: segundo_nombre,
      segundo_apellido: segundo_apellido,
      nombre: nombre,
      fecha_nacimiento: fecha_nacimiento,
      edad: edad,
      telefono: telefono,
      celular: celular,
      departamento: departamento,
      municipio: municipio,
      barrio: barrio,
      direccion: direccion,
      eps: eps,
      geo_lat: geo_lat,
      geo_lng: geo_lng,
      cie: cie,
    );
  }

  Patient fromJson(Map<String, Object?> json) {
    return Patient.fromJson(json);
  }
}

/// @nodoc
const $Patient = _$PatientTearOff();

/// @nodoc
mixin _$Patient {
  int get paciente_id => throw _privateConstructorUsedError;
  int get tipo_identificacionId => throw _privateConstructorUsedError;
  String get tipo_identificacion => throw _privateConstructorUsedError;
  String get identificacion => throw _privateConstructorUsedError;
  String get primer_nombre => throw _privateConstructorUsedError;
  String get primer_apellido => throw _privateConstructorUsedError;
  String get segundo_nombre => throw _privateConstructorUsedError;
  String get segundo_apellido => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  String get fecha_nacimiento => throw _privateConstructorUsedError;
  int get edad => throw _privateConstructorUsedError;
  String get telefono => throw _privateConstructorUsedError;
  String get celular => throw _privateConstructorUsedError;
  String get departamento => throw _privateConstructorUsedError;
  String get municipio => throw _privateConstructorUsedError;
  String get barrio => throw _privateConstructorUsedError;
  String get direccion => throw _privateConstructorUsedError;
  String get eps => throw _privateConstructorUsedError;
  double get geo_lat => throw _privateConstructorUsedError;
  double get geo_lng => throw _privateConstructorUsedError;
  List<Cie> get cie => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res>;
  $Res call(
      {int paciente_id,
      int tipo_identificacionId,
      String tipo_identificacion,
      String identificacion,
      String primer_nombre,
      String primer_apellido,
      String segundo_nombre,
      String segundo_apellido,
      String nombre,
      String fecha_nacimiento,
      int edad,
      String telefono,
      String celular,
      String departamento,
      String municipio,
      String barrio,
      String direccion,
      String eps,
      double geo_lat,
      double geo_lng,
      List<Cie> cie});
}

/// @nodoc
class _$PatientCopyWithImpl<$Res> implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  final Patient _value;
  // ignore: unused_field
  final $Res Function(Patient) _then;

  @override
  $Res call({
    Object? paciente_id = freezed,
    Object? tipo_identificacionId = freezed,
    Object? tipo_identificacion = freezed,
    Object? identificacion = freezed,
    Object? primer_nombre = freezed,
    Object? primer_apellido = freezed,
    Object? segundo_nombre = freezed,
    Object? segundo_apellido = freezed,
    Object? nombre = freezed,
    Object? fecha_nacimiento = freezed,
    Object? edad = freezed,
    Object? telefono = freezed,
    Object? celular = freezed,
    Object? departamento = freezed,
    Object? municipio = freezed,
    Object? barrio = freezed,
    Object? direccion = freezed,
    Object? eps = freezed,
    Object? geo_lat = freezed,
    Object? geo_lng = freezed,
    Object? cie = freezed,
  }) {
    return _then(_value.copyWith(
      paciente_id: paciente_id == freezed
          ? _value.paciente_id
          : paciente_id // ignore: cast_nullable_to_non_nullable
              as int,
      tipo_identificacionId: tipo_identificacionId == freezed
          ? _value.tipo_identificacionId
          : tipo_identificacionId // ignore: cast_nullable_to_non_nullable
              as int,
      tipo_identificacion: tipo_identificacion == freezed
          ? _value.tipo_identificacion
          : tipo_identificacion // ignore: cast_nullable_to_non_nullable
              as String,
      identificacion: identificacion == freezed
          ? _value.identificacion
          : identificacion // ignore: cast_nullable_to_non_nullable
              as String,
      primer_nombre: primer_nombre == freezed
          ? _value.primer_nombre
          : primer_nombre // ignore: cast_nullable_to_non_nullable
              as String,
      primer_apellido: primer_apellido == freezed
          ? _value.primer_apellido
          : primer_apellido // ignore: cast_nullable_to_non_nullable
              as String,
      segundo_nombre: segundo_nombre == freezed
          ? _value.segundo_nombre
          : segundo_nombre // ignore: cast_nullable_to_non_nullable
              as String,
      segundo_apellido: segundo_apellido == freezed
          ? _value.segundo_apellido
          : segundo_apellido // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: nombre == freezed
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      fecha_nacimiento: fecha_nacimiento == freezed
          ? _value.fecha_nacimiento
          : fecha_nacimiento // ignore: cast_nullable_to_non_nullable
              as String,
      edad: edad == freezed
          ? _value.edad
          : edad // ignore: cast_nullable_to_non_nullable
              as int,
      telefono: telefono == freezed
          ? _value.telefono
          : telefono // ignore: cast_nullable_to_non_nullable
              as String,
      celular: celular == freezed
          ? _value.celular
          : celular // ignore: cast_nullable_to_non_nullable
              as String,
      departamento: departamento == freezed
          ? _value.departamento
          : departamento // ignore: cast_nullable_to_non_nullable
              as String,
      municipio: municipio == freezed
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
      barrio: barrio == freezed
          ? _value.barrio
          : barrio // ignore: cast_nullable_to_non_nullable
              as String,
      direccion: direccion == freezed
          ? _value.direccion
          : direccion // ignore: cast_nullable_to_non_nullable
              as String,
      eps: eps == freezed
          ? _value.eps
          : eps // ignore: cast_nullable_to_non_nullable
              as String,
      geo_lat: geo_lat == freezed
          ? _value.geo_lat
          : geo_lat // ignore: cast_nullable_to_non_nullable
              as double,
      geo_lng: geo_lng == freezed
          ? _value.geo_lng
          : geo_lng // ignore: cast_nullable_to_non_nullable
              as double,
      cie: cie == freezed
          ? _value.cie
          : cie // ignore: cast_nullable_to_non_nullable
              as List<Cie>,
    ));
  }
}

/// @nodoc
abstract class _$PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$PatientCopyWith(_Patient value, $Res Function(_Patient) then) =
      __$PatientCopyWithImpl<$Res>;
  @override
  $Res call(
      {int paciente_id,
      int tipo_identificacionId,
      String tipo_identificacion,
      String identificacion,
      String primer_nombre,
      String primer_apellido,
      String segundo_nombre,
      String segundo_apellido,
      String nombre,
      String fecha_nacimiento,
      int edad,
      String telefono,
      String celular,
      String departamento,
      String municipio,
      String barrio,
      String direccion,
      String eps,
      double geo_lat,
      double geo_lng,
      List<Cie> cie});
}

/// @nodoc
class __$PatientCopyWithImpl<$Res> extends _$PatientCopyWithImpl<$Res>
    implements _$PatientCopyWith<$Res> {
  __$PatientCopyWithImpl(_Patient _value, $Res Function(_Patient) _then)
      : super(_value, (v) => _then(v as _Patient));

  @override
  _Patient get _value => super._value as _Patient;

  @override
  $Res call({
    Object? paciente_id = freezed,
    Object? tipo_identificacionId = freezed,
    Object? tipo_identificacion = freezed,
    Object? identificacion = freezed,
    Object? primer_nombre = freezed,
    Object? primer_apellido = freezed,
    Object? segundo_nombre = freezed,
    Object? segundo_apellido = freezed,
    Object? nombre = freezed,
    Object? fecha_nacimiento = freezed,
    Object? edad = freezed,
    Object? telefono = freezed,
    Object? celular = freezed,
    Object? departamento = freezed,
    Object? municipio = freezed,
    Object? barrio = freezed,
    Object? direccion = freezed,
    Object? eps = freezed,
    Object? geo_lat = freezed,
    Object? geo_lng = freezed,
    Object? cie = freezed,
  }) {
    return _then(_Patient(
      paciente_id: paciente_id == freezed
          ? _value.paciente_id
          : paciente_id // ignore: cast_nullable_to_non_nullable
              as int,
      tipo_identificacionId: tipo_identificacionId == freezed
          ? _value.tipo_identificacionId
          : tipo_identificacionId // ignore: cast_nullable_to_non_nullable
              as int,
      tipo_identificacion: tipo_identificacion == freezed
          ? _value.tipo_identificacion
          : tipo_identificacion // ignore: cast_nullable_to_non_nullable
              as String,
      identificacion: identificacion == freezed
          ? _value.identificacion
          : identificacion // ignore: cast_nullable_to_non_nullable
              as String,
      primer_nombre: primer_nombre == freezed
          ? _value.primer_nombre
          : primer_nombre // ignore: cast_nullable_to_non_nullable
              as String,
      primer_apellido: primer_apellido == freezed
          ? _value.primer_apellido
          : primer_apellido // ignore: cast_nullable_to_non_nullable
              as String,
      segundo_nombre: segundo_nombre == freezed
          ? _value.segundo_nombre
          : segundo_nombre // ignore: cast_nullable_to_non_nullable
              as String,
      segundo_apellido: segundo_apellido == freezed
          ? _value.segundo_apellido
          : segundo_apellido // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: nombre == freezed
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      fecha_nacimiento: fecha_nacimiento == freezed
          ? _value.fecha_nacimiento
          : fecha_nacimiento // ignore: cast_nullable_to_non_nullable
              as String,
      edad: edad == freezed
          ? _value.edad
          : edad // ignore: cast_nullable_to_non_nullable
              as int,
      telefono: telefono == freezed
          ? _value.telefono
          : telefono // ignore: cast_nullable_to_non_nullable
              as String,
      celular: celular == freezed
          ? _value.celular
          : celular // ignore: cast_nullable_to_non_nullable
              as String,
      departamento: departamento == freezed
          ? _value.departamento
          : departamento // ignore: cast_nullable_to_non_nullable
              as String,
      municipio: municipio == freezed
          ? _value.municipio
          : municipio // ignore: cast_nullable_to_non_nullable
              as String,
      barrio: barrio == freezed
          ? _value.barrio
          : barrio // ignore: cast_nullable_to_non_nullable
              as String,
      direccion: direccion == freezed
          ? _value.direccion
          : direccion // ignore: cast_nullable_to_non_nullable
              as String,
      eps: eps == freezed
          ? _value.eps
          : eps // ignore: cast_nullable_to_non_nullable
              as String,
      geo_lat: geo_lat == freezed
          ? _value.geo_lat
          : geo_lat // ignore: cast_nullable_to_non_nullable
              as double,
      geo_lng: geo_lng == freezed
          ? _value.geo_lng
          : geo_lng // ignore: cast_nullable_to_non_nullable
              as double,
      cie: cie == freezed
          ? _value.cie
          : cie // ignore: cast_nullable_to_non_nullable
              as List<Cie>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Patient implements _Patient {
  const _$_Patient(
      {required this.paciente_id,
      required this.tipo_identificacionId,
      required this.tipo_identificacion,
      required this.identificacion,
      required this.primer_nombre,
      required this.primer_apellido,
      required this.segundo_nombre,
      required this.segundo_apellido,
      required this.nombre,
      required this.fecha_nacimiento,
      required this.edad,
      required this.telefono,
      required this.celular,
      required this.departamento,
      required this.municipio,
      required this.barrio,
      required this.direccion,
      required this.eps,
      required this.geo_lat,
      required this.geo_lng,
      required this.cie});

  factory _$_Patient.fromJson(Map<String, dynamic> json) =>
      _$$_PatientFromJson(json);

  @override
  final int paciente_id;
  @override
  final int tipo_identificacionId;
  @override
  final String tipo_identificacion;
  @override
  final String identificacion;
  @override
  final String primer_nombre;
  @override
  final String primer_apellido;
  @override
  final String segundo_nombre;
  @override
  final String segundo_apellido;
  @override
  final String nombre;
  @override
  final String fecha_nacimiento;
  @override
  final int edad;
  @override
  final String telefono;
  @override
  final String celular;
  @override
  final String departamento;
  @override
  final String municipio;
  @override
  final String barrio;
  @override
  final String direccion;
  @override
  final String eps;
  @override
  final double geo_lat;
  @override
  final double geo_lng;
  @override
  final List<Cie> cie;

  @override
  String toString() {
    return 'Patient(paciente_id: $paciente_id, tipo_identificacionId: $tipo_identificacionId, tipo_identificacion: $tipo_identificacion, identificacion: $identificacion, primer_nombre: $primer_nombre, primer_apellido: $primer_apellido, segundo_nombre: $segundo_nombre, segundo_apellido: $segundo_apellido, nombre: $nombre, fecha_nacimiento: $fecha_nacimiento, edad: $edad, telefono: $telefono, celular: $celular, departamento: $departamento, municipio: $municipio, barrio: $barrio, direccion: $direccion, eps: $eps, geo_lat: $geo_lat, geo_lng: $geo_lng, cie: $cie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Patient &&
            const DeepCollectionEquality()
                .equals(other.paciente_id, paciente_id) &&
            const DeepCollectionEquality()
                .equals(other.tipo_identificacionId, tipo_identificacionId) &&
            const DeepCollectionEquality()
                .equals(other.tipo_identificacion, tipo_identificacion) &&
            const DeepCollectionEquality()
                .equals(other.identificacion, identificacion) &&
            const DeepCollectionEquality()
                .equals(other.primer_nombre, primer_nombre) &&
            const DeepCollectionEquality()
                .equals(other.primer_apellido, primer_apellido) &&
            const DeepCollectionEquality()
                .equals(other.segundo_nombre, segundo_nombre) &&
            const DeepCollectionEquality()
                .equals(other.segundo_apellido, segundo_apellido) &&
            const DeepCollectionEquality().equals(other.nombre, nombre) &&
            const DeepCollectionEquality()
                .equals(other.fecha_nacimiento, fecha_nacimiento) &&
            const DeepCollectionEquality().equals(other.edad, edad) &&
            const DeepCollectionEquality().equals(other.telefono, telefono) &&
            const DeepCollectionEquality().equals(other.celular, celular) &&
            const DeepCollectionEquality()
                .equals(other.departamento, departamento) &&
            const DeepCollectionEquality().equals(other.municipio, municipio) &&
            const DeepCollectionEquality().equals(other.barrio, barrio) &&
            const DeepCollectionEquality().equals(other.direccion, direccion) &&
            const DeepCollectionEquality().equals(other.eps, eps) &&
            const DeepCollectionEquality().equals(other.geo_lat, geo_lat) &&
            const DeepCollectionEquality().equals(other.geo_lng, geo_lng) &&
            const DeepCollectionEquality().equals(other.cie, cie));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(paciente_id),
        const DeepCollectionEquality().hash(tipo_identificacionId),
        const DeepCollectionEquality().hash(tipo_identificacion),
        const DeepCollectionEquality().hash(identificacion),
        const DeepCollectionEquality().hash(primer_nombre),
        const DeepCollectionEquality().hash(primer_apellido),
        const DeepCollectionEquality().hash(segundo_nombre),
        const DeepCollectionEquality().hash(segundo_apellido),
        const DeepCollectionEquality().hash(nombre),
        const DeepCollectionEquality().hash(fecha_nacimiento),
        const DeepCollectionEquality().hash(edad),
        const DeepCollectionEquality().hash(telefono),
        const DeepCollectionEquality().hash(celular),
        const DeepCollectionEquality().hash(departamento),
        const DeepCollectionEquality().hash(municipio),
        const DeepCollectionEquality().hash(barrio),
        const DeepCollectionEquality().hash(direccion),
        const DeepCollectionEquality().hash(eps),
        const DeepCollectionEquality().hash(geo_lat),
        const DeepCollectionEquality().hash(geo_lng),
        const DeepCollectionEquality().hash(cie)
      ]);

  @JsonKey(ignore: true)
  @override
  _$PatientCopyWith<_Patient> get copyWith =>
      __$PatientCopyWithImpl<_Patient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientToJson(this);
  }
}

abstract class _Patient implements Patient {
  const factory _Patient(
      {required int paciente_id,
      required int tipo_identificacionId,
      required String tipo_identificacion,
      required String identificacion,
      required String primer_nombre,
      required String primer_apellido,
      required String segundo_nombre,
      required String segundo_apellido,
      required String nombre,
      required String fecha_nacimiento,
      required int edad,
      required String telefono,
      required String celular,
      required String departamento,
      required String municipio,
      required String barrio,
      required String direccion,
      required String eps,
      required double geo_lat,
      required double geo_lng,
      required List<Cie> cie}) = _$_Patient;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$_Patient.fromJson;

  @override
  int get paciente_id;
  @override
  int get tipo_identificacionId;
  @override
  String get tipo_identificacion;
  @override
  String get identificacion;
  @override
  String get primer_nombre;
  @override
  String get primer_apellido;
  @override
  String get segundo_nombre;
  @override
  String get segundo_apellido;
  @override
  String get nombre;
  @override
  String get fecha_nacimiento;
  @override
  int get edad;
  @override
  String get telefono;
  @override
  String get celular;
  @override
  String get departamento;
  @override
  String get municipio;
  @override
  String get barrio;
  @override
  String get direccion;
  @override
  String get eps;
  @override
  double get geo_lat;
  @override
  double get geo_lng;
  @override
  List<Cie> get cie;
  @override
  @JsonKey(ignore: true)
  _$PatientCopyWith<_Patient> get copyWith =>
      throw _privateConstructorUsedError;
}
