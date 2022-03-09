// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_by_services.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FormByServices _$$_FormByServicesFromJson(Map<String, dynamic> json) =>
    _$_FormByServices(
      item: (json['item'] as List<dynamic>)
          .map((e) => FormItemByServices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FormByServicesToJson(_$_FormByServices instance) =>
    <String, dynamic>{
      'item': instance.item,
    };
