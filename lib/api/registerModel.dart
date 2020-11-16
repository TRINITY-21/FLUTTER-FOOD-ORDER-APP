import 'package:json_annotation/json_annotation.dart';

part 'registerModel.g.dart';

@JsonSerializable()
class RegistersModel {
  String name;
  String email;
  String password;
  String id;
  @JsonKey(name: '_id')
  RegistersModel({this.email, this.id, this.name, this.password});

  factory RegistersModel.fromJson(Map<String, dynamic> json) =>
      _$RegistersModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistersModelToJson(this);
}