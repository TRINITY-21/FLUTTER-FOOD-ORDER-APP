// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foodModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) {
  return FoodModel(
    filePath: json['filePath'] as String,
    price: json['price'] as int,
    id: json['_id'] as String,
    title: json['title'] as String,
    views: json['views'] as int,
  );
}

Map<String, dynamic> _$FoodModelToJson(FoodModel instance) => <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'filePath': instance.filePath,
      '_id': instance.id,
      'views': instance.views,
    };
