import 'package:opinarti/models/support/user_model.dart';

SupportModel $SupportModelFromJson(Map<String, dynamic> json) => SupportModel(
      subject: json['subject'] as String?,
      body: json['body'] as String?,
      answered: json['answered'] as bool?,
    );

Map<String, dynamic> $UserModelToJson(SupportModel instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'body': instance.body,
      'answered': instance.answered,
    };
