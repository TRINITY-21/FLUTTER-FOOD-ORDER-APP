import 'package:ange/api/foodModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cartItems.g.dart';

@JsonSerializable()
class CartItems {
  String onlineUser;
  FoodModel books;
  FoodModel movieId;
  @JsonKey(name: '_id')
  String id;

  CartItems({this.id,this.movieId,this.books, this.onlineUser});

  factory CartItems.fromJson(Map<String, dynamic> json) =>
      _$CartItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemsToJson(this);
}
