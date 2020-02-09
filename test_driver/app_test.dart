import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Podcustard App', () {
    // define the Finders used to locate widgets
    final homePageTextFinder = find.byValueKey('a');
    final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('navigates to MainPage on load', () async {
      expect(await driver.getText(homePageTextFinder), 'Index 0: Home');
    });

    test('stores user details when Auth Service emits action', () async {
      // TODO: check the User is displayed
    });
  });
}
