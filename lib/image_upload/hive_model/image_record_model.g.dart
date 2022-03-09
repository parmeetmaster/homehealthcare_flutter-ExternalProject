// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageRecordModelAdapter extends TypeAdapter<ImageRecordModel> {
  @override
  final int typeId = 0;

  @override
  ImageRecordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageRecordModel(
      fields[0] as String?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ImageRecordModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageRecordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
