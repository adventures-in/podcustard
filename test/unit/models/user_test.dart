import 'package:built_collection/built_collection.dart';
import 'package:podcustard/models/provider_info.dart';
import 'package:podcustard/models/user.dart';
import 'package:test/test.dart';

void main() {
  group('User', () {
    test('has nullable list member, creates empty list', () {
      // uid, email, displayName, photoUrl are non-null
      final user = User((b) => b
        ..uid = 'id'
        ..email = 'email'
        ..displayName = 'name'
        ..photoUrl = 'url');

      expect(user.uid, 'id');
      expect(user.email, 'email');
      expect(user.displayName, 'name');
      expect(user.photoUrl, 'url');
      // we should still have an empty list even without passing anything in
      // the constructor
      expect(user.providers, BuiltList<ProviderInfo>.from([]));
    });

    test('members take expected values', () {
      final providerInfo = ProviderInfo((b) => b
        ..displayName = 'name'
        ..providerId = 'provider'
        ..photoUrl = 'url'
        ..email = 'email'
        ..uid = 'uid');

      final user = User((a) => a
        ..email = 'email'
        ..uid = 'id'
        ..displayName = 'name'
        ..photoUrl = 'url'
        ..providers = ListBuilder([providerInfo]));

      expect(user.uid, 'id');
      expect(user.email, 'email');
    });
  });
}
