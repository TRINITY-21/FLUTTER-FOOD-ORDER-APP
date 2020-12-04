// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListModel _$ListModelFromJson(Map<String, dynamic> json) {
  return ListModel(
    book: (json['book'] as List)
        ?.map((e) =>
            e == null ? null : FoodModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    books: (json['books'] as List)
        ?.map((e) =>
            e == null ? null : FoodModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListModelToJson(ListModel instance) => <String, dynamic>{
      'book': instance.book,
      'books': instance.books,
    };
