import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opinarti/models/user/user_model.dart';

part 'support_result.freezed.dart';

@freezed
class SupportResult with _$SupportResult {
  factory SupportResult.success(UserModel user) = Success;
  factory SupportResult.error(String message) = Error;
}
