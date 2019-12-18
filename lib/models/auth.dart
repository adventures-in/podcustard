library auth;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:podcustard/redux/serializers.dart';

part 'auth.g.dart';

abstract class Auth implements Built<Auth, AuthBuilder> {
  String get providerType;
  String get providerId;

  Auth._();

  factory Auth([void updates(AuthBuilder b)]) = _$Auth;

  Object toJson() => serializers.serializeWith(Auth.serializer, this);

  static Auth fromJson(String jsonString) =>
      serializers.deserializeWith(Auth.serializer, json.decode(jsonString));

  static Serializer<Auth> get serializer => _$authSerializer;
}
