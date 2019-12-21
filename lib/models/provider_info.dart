library provider_info;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:podcustard/redux/serializers.dart';

part 'provider_info.g.dart';

abstract class ProviderInfo
    implements Built<ProviderInfo, ProviderInfoBuilder> {
  /// The provider identifier.
  String get providerId;

  /// The provider’s user ID for the user.
  String get uid;

  /// The name of the user.
  @nullable
  String get displayName;

  /// The URL of the user’s profile photo.
  @nullable
  String get photoUrl;

  /// The user’s email address.
  @nullable
  String get email;

  /// The user's phone number.
  @nullable
  String get phoneNumber;

  ProviderInfo._();

  factory ProviderInfo([void Function(ProviderInfoBuilder) updates]) =
      _$ProviderInfo;

  Object toJson() => serializers.serializeWith(ProviderInfo.serializer, this);

  static ProviderInfo fromJson(String jsonString) => serializers
      .deserializeWith(ProviderInfo.serializer, json.decode(jsonString));

  static Serializer<ProviderInfo> get serializer => _$providerInfoSerializer;
}
