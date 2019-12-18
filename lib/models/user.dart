library user;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:podcustard/models/auth.dart';
import 'package:podcustard/redux/serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  AuthStateEnum get authState;
  @nullable
  Auth get auth;
  @nullable
  String get id;
  @nullable
  String get email;

  User._();

  factory User([void updates(UserBuilder b)]) = _$User;

  Object toJson() => serializers.serializeWith(User.serializer, this);

  static User fromJson(String jsonString) =>
      serializers.deserializeWith(User.serializer, json.decode(jsonString));

  static Serializer<User> get serializer => _$userSerializer;
}

class AuthStateEnum extends EnumClass {
  static Serializer<AuthStateEnum> get serializer => _$authStateEnumSerializer;

  static const AuthStateEnum precheck = _$precheck;
  static const AuthStateEnum checking = _$checking;
  static const AuthStateEnum found_auth = _$found_auth;
  static const AuthStateEnum found_none = _$found_none;

  const AuthStateEnum._(String name) : super(name);

  static BuiltSet<AuthStateEnum> get values => _$values;
  static AuthStateEnum valueOf(String name) => _$valueOf(name);
}
