import 'package:json_annotation/json_annotation.dart';
import 'package:opinarti/models/user/user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'fullname')
  String? name;
  String? lastName;
  String? email;
  String? phone;
  String? cnpj;
  String? password;
  String? id;
  String? token;
  bool? admin;
  bool? owner;
  bool? manager;
  bool? blocked;
  String? createdAt;
  String? updatedAt;

  UserModel({
    this.name,
    this.lastName,
    this.email,
    this.phone,
    this.cnpj,
    this.password,
    this.id,
    this.token,
    this.admin,
    this.manager,
    this.owner,
    this.blocked,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => $UserModelFromJson(json);

  Map<String, dynamic> toJson() => $UserModelToJson(this);

  @override
  String toString() {
    return 'UserModel(admin: $admin,owner: $owner, block: $blocked, manager: $manager, name: $name, lastName: $lastName, email: $email, phone: $phone, cnpj: $cnpj, password: $password, id: $id, token: $token)';
  }
}
