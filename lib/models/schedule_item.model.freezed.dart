// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_item.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleItem _$ScheduleItemFromJson(Map<String, dynamic> json) {
  return _ScheduleItem.fromJson(json);
}

/// @nodoc
class _$ScheduleItemTearOff {
  const _$ScheduleItemTearOff();

  _ScheduleItem call(
      {required Patient paciente,
      required int ordentrabajo_id,
      required String ordentrabajo_validahasta,
      required int ordenservicio_id,
      required int servicio_id,
      required String servicio,
      required int actividades_asignadas,
      required int actividades_realizadas}) {
    return _ScheduleItem(
      paciente: paciente,
      ordentrabajo_id: ordentrabajo_id,
      ordentrabajo_validahasta: ordentrabajo_validahasta,
      ordenservicio_id: ordenservicio_id,
      servicio_id: servicio_id,
      servicio: servicio,
      actividades_asignadas: actividades_asignadas,
      actividades_realizadas: actividades_realizadas,
    );
  }

  ScheduleItem fromJson(Map<String, Object?> json) {
    return ScheduleItem.fromJson(json);
  }
}

/// @nodoc
const $ScheduleItem = _$ScheduleItemTearOff();

/// @nodoc
mixin _$ScheduleItem {
  Patient get paciente => throw _privateConstructorUsedError;
  int get ordentrabajo_id => throw _privateConstructorUsedError;
  String get ordentrabajo_validahasta => throw _privateConstructorUsedError;
  int get ordenservicio_id => throw _privateConstructorUsedError;
  int get servicio_id => throw _privateConstructorUsedError;
  String get servicio => throw _privateConstructorUsedError;
  int get actividades_asignadas => throw _privateConstructorUsedError;
  int get actividades_realizadas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleItemCopyWith<ScheduleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleItemCopyWith<$Res> {
  factory $ScheduleItemCopyWith(
          ScheduleItem value, $Res Function(ScheduleItem) then) =
      _$ScheduleItemCopyWithImpl<$Res>;
  $Res call(
      {Patient paciente,
      int ordentrabajo_id,
      String ordentrabajo_validahasta,
      int ordenservicio_id,
      int servicio_id,
      String servicio,
      int actividades_asignadas,
      int actividades_realizadas});

  $PatientCopyWith<$Res> get paciente;
}

/// @nodoc
class _$ScheduleItemCopyWithImpl<$Res> implements $ScheduleItemCopyWith<$Res> {
  _$ScheduleItemCopyWithImpl(this._value, this._then);

  final ScheduleItem _value;
  // ignore: unused_field
  final $Res Function(ScheduleItem) _then;

  @override
  $Res call({
    Object? paciente = freezed,
    Object? ordentrabajo_id = freezed,
    Object? ordentrabajo_validahasta = freezed,
    Object? ordenservicio_id = freezed,
    Object? servicio_id = freezed,
    Object? servicio = freezed,
    Object? actividades_asignadas = freezed,
    Object? actividades_realizadas = freezed,
  }) {
    return _then(_value.copyWith(
      paciente: paciente == freezed
          ? _value.paciente
          : paciente // ignore: cast_nullable_to_non_nullable
              as Patient,
      ordentrabajo_id: ordentrabajo_id == freezed
          ? _value.ordentrabajo_id
          : ordentrabajo_id // ignore: cast_nullable_to_non_nullable
              as int,
      ordentrabajo_validahasta: ordentrabajo_validahasta == freezed
          ? _value.ordentrabajo_validahasta
          : ordentrabajo_validahasta // ignore: cast_nullable_to_non_nullable
              as String,
      ordenservicio_id: ordenservicio_id == freezed
          ? _value.ordenservicio_id
          : ordenservicio_id // ignore: cast_nullable_to_non_nullable
              as int,
      servicio_id: servicio_id == freezed
          ? _value.servicio_id
          : servicio_id // ignore: cast_nullable_to_non_nullable
              as int,
      servicio: servicio == freezed
          ? _value.servicio
          : servicio // ignore: cast_nullable_to_non_nullable
              as String,
      actividades_asignadas: actividades_asignadas == freezed
          ? _value.actividades_asignadas
          : actividades_asignadas // ignore: cast_nullable_to_non_nullable
              as int,
      actividades_realizadas: actividades_realizadas == freezed
          ? _value.actividades_realizadas
          : actividades_realizadas // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $PatientCopyWith<$Res> get paciente {
    return $PatientCopyWith<$Res>(_value.paciente, (value) {
      return _then(_value.copyWith(paciente: value));
    });
  }
}

/// @nodoc
abstract class _$ScheduleItemCopyWith<$Res>
    implements $ScheduleItemCopyWith<$Res> {
  factory _$ScheduleItemCopyWith(
          _ScheduleItem value, $Res Function(_ScheduleItem) then) =
      __$ScheduleItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {Patient paciente,
      int ordentrabajo_id,
      String ordentrabajo_validahasta,
      int ordenservicio_id,
      int servicio_id,
      String servicio,
      int actividades_asignadas,
      int actividades_realizadas});

  @override
  $PatientCopyWith<$Res> get paciente;
}

/// @nodoc
class __$ScheduleItemCopyWithImpl<$Res> extends _$ScheduleItemCopyWithImpl<$Res>
    implements _$ScheduleItemCopyWith<$Res> {
  __$ScheduleItemCopyWithImpl(
      _ScheduleItem _value, $Res Function(_ScheduleItem) _then)
      : super(_value, (v) => _then(v as _ScheduleItem));

  @override
  _ScheduleItem get _value => super._value as _ScheduleItem;

  @override
  $Res call({
    Object? paciente = freezed,
    Object? ordentrabajo_id = freezed,
    Object? ordentrabajo_validahasta = freezed,
    Object? ordenservicio_id = freezed,
    Object? servicio_id = freezed,
    Object? servicio = freezed,
    Object? actividades_asignadas = freezed,
    Object? actividades_realizadas = freezed,
  }) {
    return _then(_ScheduleItem(
      paciente: paciente == freezed
          ? _value.paciente
          : paciente // ignore: cast_nullable_to_non_nullable
              as Patient,
      ordentrabajo_id: ordentrabajo_id == freezed
          ? _value.ordentrabajo_id
          : ordentrabajo_id // ignore: cast_nullable_to_non_nullable
              as int,
      ordentrabajo_validahasta: ordentrabajo_validahasta == freezed
          ? _value.ordentrabajo_validahasta
          : ordentrabajo_validahasta // ignore: cast_nullable_to_non_nullable
              as String,
      ordenservicio_id: ordenservicio_id == freezed
          ? _value.ordenservicio_id
          : ordenservicio_id // ignore: cast_nullable_to_non_nullable
              as int,
      servicio_id: servicio_id == freezed
          ? _value.servicio_id
          : servicio_id // ignore: cast_nullable_to_non_nullable
              as int,
      servicio: servicio == freezed
          ? _value.servicio
          : servicio // ignore: cast_nullable_to_non_nullable
              as String,
      actividades_asignadas: actividades_asignadas == freezed
          ? _value.actividades_asignadas
          : actividades_asignadas // ignore: cast_nullable_to_non_nullable
              as int,
      actividades_realizadas: actividades_realizadas == freezed
          ? _value.actividades_realizadas
          : actividades_realizadas // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ScheduleItem implements _ScheduleItem {
  const _$_ScheduleItem(
      {required this.paciente,
      required this.ordentrabajo_id,
      required this.ordentrabajo_validahasta,
      required this.ordenservicio_id,
      required this.servicio_id,
      required this.servicio,
      required this.actividades_asignadas,
      required this.actividades_realizadas});

  factory _$_ScheduleItem.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleItemFromJson(json);

  @override
  final Patient paciente;
  @override
  final int ordentrabajo_id;
  @override
  final String ordentrabajo_validahasta;
  @override
  final int ordenservicio_id;
  @override
  final int servicio_id;
  @override
  final String servicio;
  @override
  final int actividades_asignadas;
  @override
  final int actividades_realizadas;

  @override
  String toString() {
    return 'ScheduleItem(paciente: $paciente, ordentrabajo_id: $ordentrabajo_id, ordentrabajo_validahasta: $ordentrabajo_validahasta, ordenservicio_id: $ordenservicio_id, servicio_id: $servicio_id, servicio: $servicio, actividades_asignadas: $actividades_asignadas, actividades_realizadas: $actividades_realizadas)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleItem &&
            const DeepCollectionEquality().equals(other.paciente, paciente) &&
            const DeepCollectionEquality()
                .equals(other.ordentrabajo_id, ordentrabajo_id) &&
            const DeepCollectionEquality().equals(
                other.ordentrabajo_validahasta, ordentrabajo_validahasta) &&
            const DeepCollectionEquality()
                .equals(other.ordenservicio_id, ordenservicio_id) &&
            const DeepCollectionEquality()
                .equals(other.servicio_id, servicio_id) &&
            const DeepCollectionEquality().equals(other.servicio, servicio) &&
            const DeepCollectionEquality()
                .equals(other.actividades_asignadas, actividades_asignadas) &&
            const DeepCollectionEquality()
                .equals(other.actividades_realizadas, actividades_realizadas));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(paciente),
      const DeepCollectionEquality().hash(ordentrabajo_id),
      const DeepCollectionEquality().hash(ordentrabajo_validahasta),
      const DeepCollectionEquality().hash(ordenservicio_id),
      const DeepCollectionEquality().hash(servicio_id),
      const DeepCollectionEquality().hash(servicio),
      const DeepCollectionEquality().hash(actividades_asignadas),
      const DeepCollectionEquality().hash(actividades_realizadas));

  @JsonKey(ignore: true)
  @override
  _$ScheduleItemCopyWith<_ScheduleItem> get copyWith =>
      __$ScheduleItemCopyWithImpl<_ScheduleItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleItemToJson(this);
  }
}

abstract class _ScheduleItem implements ScheduleItem {
  const factory _ScheduleItem(
      {required Patient paciente,
      required int ordentrabajo_id,
      required String ordentrabajo_validahasta,
      required int ordenservicio_id,
      required int servicio_id,
      required String servicio,
      required int actividades_asignadas,
      required int actividades_realizadas}) = _$_ScheduleItem;

  factory _ScheduleItem.fromJson(Map<String, dynamic> json) =
      _$_ScheduleItem.fromJson;

  @override
  Patient get paciente;
  @override
  int get ordentrabajo_id;
  @override
  String get ordentrabajo_validahasta;
  @override
  int get ordenservicio_id;
  @override
  int get servicio_id;
  @override
  String get servicio;
  @override
  int get actividades_asignadas;
  @override
  int get actividades_realizadas;
  @override
  @JsonKey(ignore: true)
  _$ScheduleItemCopyWith<_ScheduleItem> get copyWith =>
      throw _privateConstructorUsedError;
}
