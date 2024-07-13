import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_user.freezed.dart';
part 'public_user.g.dart';

@freezed
abstract class PublicUser implements _$PublicUser {
  const factory PublicUser({
    required int followingCount,
    required int followerCount,
    required String uid,
  }) = _PublicUser;

  factory PublicUser.fromJson(Map<String, dynamic> json) =>
      _$PublicUserFromJson(json);
}
