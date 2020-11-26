// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foodModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) {
  return FoodModel(
    filePath: json['filePath'] as String,
    price: json['price'] as int,
    id: json['id'] as String,
    title: json['title'] as String,
    views: json['_id'] as String,
  );
}

Map<String, dynamic> _$FoodModelToJson(FoodModel instance) => <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'filePath': instance.filePath,
      'id': instance.id,
      '_id': instance.views,
    };
