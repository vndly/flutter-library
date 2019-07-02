import 'package:flutter/material.dart';
import 'package:flutter_library/resources/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_library/screens/app/flutter_library.dart';

void main() {
  setupLocatorDev();

  testWidgets('Flutter Driver demo', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(FlutterLibrary());

    // Verify that our counter starts at 0.
    expect(find.text('UI'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
