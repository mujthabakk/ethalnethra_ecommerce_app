// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailsImpl _$$UserDetailsImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailsImpl(
      id: stringFromJson(json['id']),
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$UserDetailsImplToJson(_$UserDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
    };

_$UpdateUserDetailsResponseImpl _$$UpdateUserDetailsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$UpdateUserDetailsResponseImpl(
  message: json['message'] as String,
  user: UserDetails.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UpdateUserDetailsResponseImplToJson(
  _$UpdateUserDetailsResponseImpl instance,
) => <String, dynamic>{'message': instance.message, 'user': instance.user};
