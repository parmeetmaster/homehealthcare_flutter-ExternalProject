import 'package:hive/hive.dart';

part 'image_record_model.g.dart';

@HiveType(typeId: 0)
class ImageRecordModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? imagePath;

  ImageRecordModel(this.id, this.imagePath);
}
