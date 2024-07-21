import 'package:fir_sample/typedefs/firestore_typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_user.freezed.dart';
part 'public_user.g.dart';

@freezed
abstract class PublicUser implements _$PublicUser {
  // インスタンスメソッド
  const PublicUser._();
  const factory PublicUser(
      {@Default(0) int followerCount,
      @Default(0) int followingCount,
      required SDMap image,
      @Default("") String name,
      required String uid}) = _PublicUser;

  factory PublicUser.fromJson(Map<String, dynamic> json) =>
      _$PublicUserFromJson(json);
}
