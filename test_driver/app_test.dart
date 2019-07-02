import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter Driver demo', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();

      Directory('screenshots').create();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('Flutter drive demo', () async {
      await driver.tap(find.text('Refresh'));
      await takeScreenshot(driver, 'screenshots/refresh.png');
      await driver.tap(find.byValueKey('button.back'));

      /*await driver.enterText('Hello !');
      await driver.waitFor(find.text('Hello !'));
      await driver.enterText('World');
      await takeScreenshot(driver, 'screenshots/new_text.png');
      await driver.waitForAbsent(find.text('Hello !'));
      await driver.waitFor(find.byValueKey('button'));
      await driver.tap(find.byValueKey('button'));
      await driver.waitFor(find.byValueKey('text'));
      await driver.scrollIntoView(find.byValueKey('text'));
      await driver.waitFor(find.text('Scroll till here'));*/
    });
  });
}

Future takeScreenshot(FlutterDriver driver, String path) async {
  final List<int> pixels = await driver.screenshot();

  final File file = File(path);
  await file.writeAsBytes(pixels);
  print('wrote $file');
  print(path);
}
