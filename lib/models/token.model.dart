
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.model.g.dart';
part 'token.model.freezed.dart';

@freezed
class Token  with _$Token{

 const factory Token({

    int? id,
    required String accessToken,
    required String tokenType,
    required String expiresAt,
 }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}