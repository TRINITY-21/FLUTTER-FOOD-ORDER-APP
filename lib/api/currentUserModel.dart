import 'package:json_annotation/json_annotation.dart';

part 'currentUserModel.g.dart';

@JsonSerializable()
class CurrentUserModel {
  String name;
  String email;
  String password;
  String image;
  @JsonKey(name: '_id')
  String id;
  String token;

  CurrentUserModel(
      {this.id,this.token,this.email, this.name, this.password, this.image});

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentUserModelToJson(this);
}
