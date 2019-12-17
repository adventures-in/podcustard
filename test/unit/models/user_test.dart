import 'package:podcustard/models/user.dart';
import 'package:test/test.dart';

void main() {
  test("User members are nullable as expected", () {
    final user = UserBuilder().build();

    expect(user.id, null);
    expect(user.email, null);
  });

  test("User members take expected values", () {
    final user = User((a) => a
      ..email = 'email'
      ..id = 'id');

    expect(user.id, 'id');
    expect(user.email, 'email');
  });
}
