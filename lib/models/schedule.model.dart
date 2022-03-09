
import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';
part 'schedule.model.g.dart';
part 'schedule.model.freezed.dart';


@freezed

class Schedule with _$Schedule {

  @JsonSerializable(explicitToJson: true)
  const factory Schedule({
    required List<ScheduleItem> item,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);

  
}
