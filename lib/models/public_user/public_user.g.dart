// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicUserImpl _$$PublicUserImplFromJson(Map<String, dynamic> json) =>
    _$PublicUserImpl(
      followingCount: (json['followingCount'] as num).toInt(),
      followerCount: (json['followerCount'] as num).toInt(),
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$PublicUserImplToJson(_$PublicUserImpl instance) =>
    <String, dynamic>{
      'followingCount': instance.followingCount,
      'followerCount': instance.followerCount,
      'uid': instance.uid,
    };
