library user;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:podcustard/models/provider_info.dart';
import 'package:podcustard/redux/serializers.dart';

part 'user.g.dart';

/// Non-null Strings: [uid], [displayName], [photoUrl], [email]
/// A list of [ProviderInfo]: providers
abstract class User implements Built<User, UserBuilder> {
  /// The uid of the user's Firebase account.
  String get uid;

  /// The name of the user.
  String get displayName;

  /// The URL of the user’s profile photo.
  String get photoUrl;

  /// The user’s email address.
  String get email;

  /// Info on each auth provider the user has linked to their account.
  BuiltList<ProviderInfo> get providers;

  User._();

  factory User([void Function(UserBuilder) updates]) = _$User;

  Object toJson() => serializers.serializeWith(User.serializer, this);

  static User fromJson(String jsonString) =>
      serializers.deserializeWith(User.serializer, json.decode(jsonString));

  static Serializer<User> get serializer => _$userSerializer;
}
