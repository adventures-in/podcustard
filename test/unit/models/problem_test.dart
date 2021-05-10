import 'package:built_value/built_value.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:podcustard/models/problem.dart';
import 'package:test/test.dart';

void main() {
  group('Problem', () {
    // create a Problem with expected values
    test('members take expected values', () {
      // save the current trace
      final trace = StackTrace.current;

      final problem = Problem(
          message: 'message',
          info: {'test': 'test'}.lock,
          trace: trace.toString());

      // check the members hold the expected values
      expect(problem.info, {'test': 'test'});
      expect(problem.trace, trace.toString());
      expect(problem.message, 'message');
    });

    test('members that are nullable default to null', () {
      // message and type are non-nullable
      // trace, state and info are nullable
      final problem = Problem(message: 'message');

      // so the members should be:
      expect(problem.info, null);
      expect(problem.trace, null);
      expect(problem.message, 'message');
    });

    test('will throw without non-null members', () {
      // message and type are non-nullable
      // trace, state and info are nullable

      // so no type should throw
      expect(() => Problem(message: 'message'),
          throwsA(const TypeMatcher<BuiltValueNullFieldError>()));

      // whereas missing trace, state or info should be fine
      expect(Problem(message: 'message'), equals(Problem(message: 'message')));
    });
  });
}
