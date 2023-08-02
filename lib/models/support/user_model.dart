import 'package:json_annotation/json_annotation.dart';
import 'package:opinarti/models/support/user_model.g.dart';

@JsonSerializable()
class SupportModel {
  String? subject;
  String? body;
  bool? answered;

  SupportModel({
    this.subject,
    this.body,
    this.answered,
  });

  factory SupportModel.fromJson(Map<String, dynamic> json) =>
      $SupportModelFromJson(json);

  Map<String, dynamic> toJson() => $UserModelToJson(this);

  @override
  String toString() {
    return 'SupportModel(subject: $subject,body: $body, answered:$answered)';
  }
}
