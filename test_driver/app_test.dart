import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Ride Comapare App', () {
    // TODO: define the Finders and use them to locate widgets

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('dispatches ObserveAuthState on load', () async {
      // TODO: check that action was dispatched
      // - not sure how difficult it is to check directly
      // - seems that driver is designed to check at the surface level only
      // - when navigation is working check that app navigates
    });

    test('stores user details when Auth Service emits action', () async {
      // TODO: check the User is displayed
    });
  });
}
