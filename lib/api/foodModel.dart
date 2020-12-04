import 'package:json_annotation/json_annotation.dart';

part 'foodModel.g.dart';

@JsonSerializable()
class FoodModel {
  String title;
  int price;
  String filePath;

  @JsonKey(name: '_id')
  String id;
  int views;

  FoodModel({this.filePath, this.price,this.id, this.title, this.views});

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodModelToJson(this);
}
