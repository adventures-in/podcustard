import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:podcustard/models/provider_info.dart';
import 'package:podcustard/models/user.dart';
import 'package:test/test.dart';

void main() {
  group('User', () {
    test('has nullable list member, creates empty list', () {
      // uid, email, displayName, photoUrl are non-null
      final user =
          User(uid: 'id', email: 'email', displayName: 'name', photoUrl: 'url');

      expect(user.uid, 'id');
      expect(user.email, 'email');
      expect(user.displayName, 'name');
      expect(user.photoUrl, 'url');
      // we should still have an empty list even without passing anything in
      // the constructor
      expect(user.providers, IList<ProviderInfo>());
    });

    test('members take expected values', () {
      final providerInfo = ProviderInfo(
          displayName: 'name',
          providerId: 'provider',
          photoUrl: 'url',
          email: 'email',
          uid: 'uid');

      final user = User(
          email: 'email',
          uid: 'id',
          displayName: 'name',
          photoUrl: 'url',
          providers: [providerInfo].lock);

      expect(user.uid, 'id');
      expect(user.email, 'email');
    });
  });
}
