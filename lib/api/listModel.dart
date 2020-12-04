import 'package:ange/api/foodModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listModel.g.dart';

@JsonSerializable()
class ListModel {

  List<FoodModel> book;
  List<FoodModel> books;
  
  //  List<FoodModel> book;

  ListModel({this.book, this.books});

  factory ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListModelToJson(this);
}
