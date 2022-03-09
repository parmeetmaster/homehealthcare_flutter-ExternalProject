// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'form_by_services.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FormByServices _$FormByServicesFromJson(Map<String, dynamic> json) {
  return _FormByServices.fromJson(json);
}

/// @nodoc
class _$FormByServicesTearOff {
  const _$FormByServicesTearOff();

  _FormByServices call({required List<FormItemByServices> item}) {
    return _FormByServices(
      item: item,
    );
  }

  FormByServices fromJson(Map<String, Object?> json) {
    return FormByServices.fromJson(json);
  }
}

/// @nodoc
const $FormByServices = _$FormByServicesTearOff();

/// @nodoc
mixin _$FormByServices {
  List<FormItemByServices> get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormByServicesCopyWith<FormByServices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormByServicesCopyWith<$Res> {
  factory $FormByServicesCopyWith(
          FormByServices value, $Res Function(FormByServices) then) =
      _$FormByServicesCopyWithImpl<$Res>;
  $Res call({List<FormItemByServices> item});
}

/// @nodoc
class _$FormByServicesCopyWithImpl<$Res>
    implements $FormByServicesCopyWith<$Res> {
  _$FormByServicesCopyWithImpl(this._value, this._then);

  final FormByServices _value;
  // ignore: unused_field
  final $Res Function(FormByServices) _then;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<FormItemByServices>,
    ));
  }
}

/// @nodoc
abstract class _$FormByServicesCopyWith<$Res>
    implements $FormByServicesCopyWith<$Res> {
  factory _$FormByServicesCopyWith(
          _FormByServices value, $Res Function(_FormByServices) then) =
      __$FormByServicesCopyWithImpl<$Res>;
  @override
  $Res call({List<FormItemByServices> item});
}

/// @nodoc
class __$FormByServicesCopyWithImpl<$Res>
    extends _$FormByServicesCopyWithImpl<$Res>
    implements _$FormByServicesCopyWith<$Res> {
  __$FormByServicesCopyWithImpl(
      _FormByServices _value, $Res Function(_FormByServices) _then)
      : super(_value, (v) => _then(v as _FormByServices));

  @override
  _FormByServices get _value => super._value as _FormByServices;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_FormByServices(
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<FormItemByServices>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FormByServices implements _FormByServices {
  const _$_FormByServices({required this.item});

  factory _$_FormByServices.fromJson(Map<String, dynamic> json) =>
      _$$_FormByServicesFromJson(json);

  @override
  final List<FormItemByServices> item;

  @override
  String toString() {
    return 'FormByServices(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormByServices &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$FormByServicesCopyWith<_FormByServices> get copyWith =>
      __$FormByServicesCopyWithImpl<_FormByServices>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FormByServicesToJson(this);
  }
}

abstract class _FormByServices implements FormByServices {
  const factory _FormByServices({required List<FormItemByServices> item}) =
      _$_FormByServices;

  factory _FormByServices.fromJson(Map<String, dynamic> json) =
      _$_FormByServices.fromJson;

  @override
  List<FormItemByServices> get item;
  @override
  @JsonKey(ignore: true)
  _$FormByServicesCopyWith<_FormByServices> get copyWith =>
      throw _privateConstructorUsedError;
}
