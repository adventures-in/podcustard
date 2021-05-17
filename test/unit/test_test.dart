import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redfire/app_state.dart' hide AppState;

void main() {
  test('description', () {
    final state = AppState.init();
    print(state is AppState);
    print(state is RedFireState);
    return expect(true, true);
  });
}
