library signin_with_google;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'signin_with_google.g.dart';

abstract class SigninWithGoogle extends Object
    with ReduxAction
    implements Built<SigninWithGoogle, SigninWithGoogleBuilder> {
  SigninWithGoogle._();

  factory SigninWithGoogle([void Function(SigninWithGoogleBuilder) updates]) =
      _$SigninWithGoogle;

  Object toJson() =>
      serializers.serializeWith(SigninWithGoogle.serializer, this);

  static SigninWithGoogle fromJson(String jsonString) => serializers
      .deserializeWith(SigninWithGoogle.serializer, json.decode(jsonString));

  static Serializer<SigninWithGoogle> get serializer =>
      _$signinWithGoogleSerializer;
}
