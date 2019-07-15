import 'package:flutter_library/resources/locator.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_library/main/main_dev.dart' as app;

void main() {
  setupLocatorDev();
  enableFlutterDriverExtension();
  app.main();
}
