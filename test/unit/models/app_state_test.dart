import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/provider_info.dart';
import 'package:podcustard/models/user.dart';
import 'package:test/test.dart';

void main() {
  ///
  /// -- Non-nullable
  ///
  /// int authStep
  /// int mainPageIndex
  /// int themeMode
  ///
  /// -- nullable
  ///
  /// BuiltList<Problem> problems
  /// User user

  group('ApState', () {
    test('deals with null for nullable members', () {
      final appState = AppState(
          authStep: 0, mainPageIndex: 0, themeMode: 0, bottomSheetShown: false);

      expect(appState.authStep, 0);
      expect(appState.mainPageIndex, 0);
      expect(appState.themeMode, 0);
      expect(appState.problems, []);
      expect(appState.user, null);
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
          providers: IList([providerInfo]));

      final problem = Problem(
          message: 'message',
          info: IMap({'test': 'test'}),
          trace: StackTrace.current.toString());

      final appState = AppState(
          authStep: 0,
          mainPageIndex: 0,
          themeMode: 0,
          bottomSheetShown: false,
          problems: [problem].lock,
          user: user);

      expect(appState.authStep, 0);
      expect(appState.mainPageIndex, 0);
      expect(appState.themeMode, 0);
      expect(appState.problems, [problem]);
      expect(appState.user, user);
    });
  });
}
