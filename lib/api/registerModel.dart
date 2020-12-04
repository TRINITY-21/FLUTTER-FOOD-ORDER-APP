import 'package:json_annotation/json_annotation.dart';

part 'registerModel.g.dart';

@JsonSerializable()
class RegistersModel {
  String name;
  String email;
  String password;
 
  @JsonKey(name: '_id')
  String id;
  String token;

  RegistersModel({this.email, this.token,this.id, this.name, this.password});

  factory RegistersModel.fromJson(Map<String, dynamic> json) =>
      _$RegistersModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistersModelToJson(this);
}
