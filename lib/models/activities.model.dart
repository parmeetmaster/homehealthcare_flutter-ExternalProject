

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_home_care/models/models.dart';

part 'activities.model.freezed.dart';
part 'activities.model.g.dart';


@freezed
class Activities with _$Activities {

  const factory Activities({

    required List<ActivitiesItem> item,

  }) =_Activities;


  factory Activities.fromJson(Map<String, dynamic> json) => _$ActivitiesFromJson(json);

  
}