import 'package:flutter/material.dart';
import 'package:flutter_library/resources/locator.dart';
import 'package:flutter_library/screens/app/flutter_library.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('widget test example', (WidgetTester tester) async {
    setupLocatorDev();

    await tester.pumpWidget(FlutterLibrary());

    await tester.tap(find.text('Dropdown'));
    await tester.pumpAndSettle();

    expect(find.text('Dropdown example'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Dropdown'));
  });
}
