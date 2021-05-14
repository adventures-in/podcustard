import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:podcustard/models/provider_info.dart';
import 'package:podcustard/models/user.dart';
import 'package:test/test.dart';

void main() {
  group('ProviderInfo', () {
    test('handles missing nullable members', () {
      // email, displayName, photoUrl, phoneNumber are nullable
      final info = ProviderInfo(uid: 'id', providerId: 'provider');

      expect(info.uid, 'id');
      expect(info.email, null);
      expect(info.providerId, 'provider');
      expect(info.displayName, null);
      expect(info.photoUrl, null);
      expect(info.phoneNumber, null);
    });

    test('members take expected values', () {
      final providerInfo = ProviderInfo(
          displayName: 'name',
          providerId: 'provider',
          photoUrl: 'url',
          email: 'email',
          uid: 'uid',
          phoneNumber: 'number');

      final user = User(
          email: 'email',
          uid: 'id',
          displayName: 'name',
          photoUrl: 'url',
          providers: [providerInfo].lock);

      expect(user.uid, 'id');
      expect(user.email, 'email');
      expect(user.displayName, 'name');
      expect(user.photoUrl, 'url');

      final info = ProviderInfo(
          displayName: 'name',
          providerId: 'provider',
          photoUrl: 'url',
          email: 'email',
          uid: 'uid',
          phoneNumber: 'number');

      expect(user.providers?.length, 1);
      expect(user.providers?.first, info);
    });
  });
}
