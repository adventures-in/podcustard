library signin_with_apple;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'signin_with_apple.g.dart';

abstract class SigninWithApple extends Object
    with ReduxAction
    implements Built<SigninWithApple, SigninWithAppleBuilder> {
  SigninWithApple._();

  factory SigninWithApple([void Function(SigninWithAppleBuilder) updates]) =
      _$SigninWithApple;

  Object toJson() =>
      serializers.serializeWith(SigninWithApple.serializer, this);

  static SigninWithApple fromJson(String jsonString) => serializers
      .deserializeWith(SigninWithApple.serializer, json.decode(jsonString));

  static Serializer<SigninWithApple> get serializer =>
      _$signinWithAppleSerializer;
}
