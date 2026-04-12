// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FiltersResponseImpl _$$FiltersResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FiltersResponseImpl(
  categories: stringListFlexibleFromJson(json['categories']),
  brands: stringListFlexibleFromJson(json['brands']),
);

Map<String, dynamic> _$$FiltersResponseImplToJson(
  _$FiltersResponseImpl instance,
) => <String, dynamic>{
  'categories': instance.categories,
  'brands': instance.brands,
};
