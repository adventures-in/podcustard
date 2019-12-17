library user;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:podcustard/redux/serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
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
