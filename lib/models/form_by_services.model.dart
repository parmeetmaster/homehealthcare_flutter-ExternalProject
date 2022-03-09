
import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';

part 'form_by_services.model.freezed.dart';
part 'form_by_services.model.g.dart';

@freezed
class FormByServices with _$FormByServices {


  const factory FormByServices({

    required List<FormItemByServices> item


  }) = _FormByServices;

   factory FormByServices.fromJson(Map<String, dynamic> json) =>
      _$FormByServicesFromJson(json);

}
