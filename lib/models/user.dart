import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/models/provider_info.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// Non-null Strings: [uid], [displayName], [photoUrl], [email]
/// A list of [ProviderInfo]: providers
@freezed
class User with _$User {
  factory User({
    /// The uid of the user's Firebase account.
    required String uid,

    /// The name of the user.
    required String displayName,

    /// The URL of the user’s profile photo.
    required String photoUrl,

    /// The user’s email address.
    required String email,

    /// Info on each auth provider the user has linked to their account.
    IList<ProviderInfo>? providers,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
