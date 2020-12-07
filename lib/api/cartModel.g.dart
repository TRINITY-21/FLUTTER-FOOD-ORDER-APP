// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return CartModel(
    id: json['_id'] as String,
    movieId: json['movieId'] as String,
    userFrom: json['userFrom'] as String,
    subscribeNumber : json['subscribeNumber'] as int,
    bookId: json['bookid'] as String,
    cartNum: json['cartNum'] as int,
    subcribed: json['subcribed'] as bool,
    books: json['books'] as String,
    onlineUser: json['onlineUser'] as String,
    search: json['search'] as String,
  )..doc = (json['doc'] as List)
      ?.map((e) =>
          e == null ? null : CartItems.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'doc': instance.doc,
      'books': instance.books,
      'onlineUser': instance.onlineUser,
      'cartNum': instance.cartNum,
      'subcribed': instance.subcribed,
      '_id': instance.id,
      'bookId':instance.bookId,
      'subscribeNumber': instance.subscribeNumber,
      'userFrom':instance.userFrom,
      'movieId':instance.movieId,
      'search':instance.search
    };
