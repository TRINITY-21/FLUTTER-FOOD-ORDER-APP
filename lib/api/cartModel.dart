import 'package:ange/api/cartItems.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cartModel.g.dart';

@JsonSerializable()
class CartModel {
  List<CartItems> doc;

  String books;
  String onlineUser;
  int cartNum;
  @JsonKey(name: '_id')
  String id;
  String bookId;
  String movieId;
  String userFrom;
  bool subcribed;
  int subscribeNumber;
  

  CartModel(
      {this.id,
      this.subscribeNumber,
      this.cartNum,
      this.userFrom,
      this.movieId,
      this.bookId,
      this.subcribed,
      this.books,
      this.onlineUser});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
