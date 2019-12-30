import 'package:built_collection/built_collection.dart';
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
  ///
  /// -- nullable
  ///
  /// BuiltList<Problem> problems
  /// User user

  group('ApState', () {
    test('deals with null for nullable members', () {
      final appState = AppState((b) => b
        ..authStep = 0
        ..mainPageIndex = 0);

      expect(appState.authStep, 0);
      expect(appState.mainPageIndex, 0);
      expect(appState.problems, []);
      expect(appState.user, null);
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

      final problem = Problem((a) => a
        ..message = 'message'
        ..type = ProblemTypeEnum.retrievePodcastSummaries
        ..info = {'test': 'test'}
        ..state.replace(AppState.init())
        ..trace = StackTrace.current.toString());

      final appState = AppState((b) => b
        ..authStep = 0
        ..mainPageIndex = 0
        ..problems.add(problem)
        ..user.replace(user));

      expect(appState.authStep, 0);
      expect(appState.mainPageIndex, 0);
      expect(appState.problems, [problem]);
      expect(appState.user, user);
    });
  });
}
