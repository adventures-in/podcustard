library store_user;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:podcustard/models/user.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'store_user.g.dart';

abstract class StoreUser extends Object
    with ReduxAction
    implements Built<StoreUser, StoreUserBuilder> {
  @nullable
  User get user;

  StoreUser._();

  factory StoreUser([void Function(StoreUserBuilder) updates]) = _$StoreUser;

  Object toJson() => serializers.serializeWith(StoreUser.serializer, this);

  static StoreUser fromJson(String jsonString) => serializers.deserializeWith(
      StoreUser.serializer, json.decode(jsonString));

  static Serializer<StoreUser> get serializer => _$storeUserSerializer;
}
