
// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.model.freezed.dart';
part 'profile.model.g.dart';


@freezed
class Profile with _$Profile {

const factory Profile({
   required int id_perfil,
  required String nombre,
  }) = _Profile;


  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);


  
}