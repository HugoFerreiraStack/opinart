import 'package:opinarti/models/user/user_model.dart';

UserModel $UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      cnpj: json['cnpj'] as String?,
      password: json['password'] as String?,
      id: json['id'] as String?,
      token: json['token'] as String?,
      admin: json['admin'] as bool?,
      blocked: json['blocked'] as bool?,
      owner: json['owner'] as bool?,
      manager: json['manager'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> $UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'cnpj': instance.cnpj,
      'password': instance.password,
      'id': instance.id,
      'token': instance.token,
      'admin': instance.admin,
      'blocked': instance.blocked,
      'owner': instance.owner,
      'manager': instance.manager,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
