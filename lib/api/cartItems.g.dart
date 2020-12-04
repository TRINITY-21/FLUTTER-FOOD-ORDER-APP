// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartItems.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItems _$CartItemsFromJson(Map<String, dynamic> json) {
  return CartItems(
    id: json['_id'] as String,
    books: json['books'] == null
        ? null
        : FoodModel.fromJson(json['books'] as Map<String, dynamic>), 
    movieId: json['movieId'] == null
        ? null
        : FoodModel.fromJson(json['movieId'] as Map<String, dynamic>),
    onlineUser: json['onlineUser'] as String,
  );
}

Map<String, dynamic> _$CartItemsToJson(CartItems instance) => <String, dynamic>{
      'onlineUser': instance.onlineUser,
      'books': instance.books,
      'movieId': instance.movieId,
      '_id': instance.id,
    };
