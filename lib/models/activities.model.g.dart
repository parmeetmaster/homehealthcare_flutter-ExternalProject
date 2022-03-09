// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Activities _$$_ActivitiesFromJson(Map<String, dynamic> json) =>
    _$_Activities(
      item: (json['item'] as List<dynamic>)
          .map((e) => ActivitiesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ActivitiesToJson(_$_Activities instance) =>
    <String, dynamic>{
      'item': instance.item,
    };
