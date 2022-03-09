// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'patients.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Patients _$PatientsFromJson(Map<String, dynamic> json) {
  return _Patients.fromJson(json);
}

/// @nodoc
class _$PatientsTearOff {
  const _$PatientsTearOff();

  _Patients call({required List<Patient> items}) {
    return _Patients(
      items: items,
    );
  }

  Patients fromJson(Map<String, Object?> json) {
    return Patients.fromJson(json);
  }
}

/// @nodoc
const $Patients = _$PatientsTearOff();

/// @nodoc
mixin _$Patients {
  List<Patient> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientsCopyWith<Patients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientsCopyWith<$Res> {
  factory $PatientsCopyWith(Patients value, $Res Function(Patients) then) =
      _$PatientsCopyWithImpl<$Res>;
  $Res call({List<Patient> items});
}

/// @nodoc
class _$PatientsCopyWithImpl<$Res> implements $PatientsCopyWith<$Res> {
  _$PatientsCopyWithImpl(this._value, this._then);

  final Patients _value;
  // ignore: unused_field
  final $Res Function(Patients) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
    ));
  }
}

/// @nodoc
abstract class _$PatientsCopyWith<$Res> implements $PatientsCopyWith<$Res> {
  factory _$PatientsCopyWith(_Patients value, $Res Function(_Patients) then) =
      __$PatientsCopyWithImpl<$Res>;
  @override
  $Res call({List<Patient> items});
}

/// @nodoc
class __$PatientsCopyWithImpl<$Res> extends _$PatientsCopyWithImpl<$Res>
    implements _$PatientsCopyWith<$Res> {
  __$PatientsCopyWithImpl(_Patients _value, $Res Function(_Patients) _then)
      : super(_value, (v) => _then(v as _Patients));

  @override
  _Patients get _value => super._value as _Patients;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_Patients(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Patients implements _Patients {
  const _$_Patients({required this.items});

  factory _$_Patients.fromJson(Map<String, dynamic> json) =>
      _$$_PatientsFromJson(json);

  @override
  final List<Patient> items;

  @override
  String toString() {
    return 'Patients(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Patients &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$PatientsCopyWith<_Patients> get copyWith =>
      __$PatientsCopyWithImpl<_Patients>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientsToJson(this);
  }
}

abstract class _Patients implements Patients {
  const factory _Patients({required List<Patient> items}) = _$_Patients;

  factory _Patients.fromJson(Map<String, dynamic> json) = _$_Patients.fromJson;

  @override
  List<Patient> get items;
  @override
  @JsonKey(ignore: true)
  _$PatientsCopyWith<_Patients> get copyWith =>
      throw _privateConstructorUsedError;
}
