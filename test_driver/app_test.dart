import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    final counterTextField = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');
    var counter = 0;

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      //const Timeout(Duration(hours: 5));
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      expect(await driver.getText(counterTextField), '0');
    });

    test('increments the counter', () async {
      while (counter < 5000) {
        await driver.tap(buttonFinder);
        counter++;
        expect(await driver.getText(counterTextField), '$counter');
      }
    });
  });
}
