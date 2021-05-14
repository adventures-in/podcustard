import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_info.freezed.dart';
part 'provider_info.g.dart';

@freezed
class ProviderInfo with _$ProviderInfo {
  factory ProviderInfo({
    /// The provider identifier.
    required String providerId,

    /// The provider’s user ID for the user.
    String? uid,

    /// The name of the user.
    String? displayName,

    /// The URL of the user’s profile photo.
    String? photoUrl,

    /// The user’s email address.
    String? email,

    /// The user's phone number.
    String? phoneNumber,
  }) = _ProviderInfo;

  factory ProviderInfo.fromJson(Map<String, Object?> json) =>
      _$ProviderInfoFromJson(json);
}
