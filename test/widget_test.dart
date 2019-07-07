import 'package:flutter_library/resources/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_library/screens/app/flutter_library.dart';

void main() {
  testWidgets('widget test example', (tester) async {
    setupLocatorDev();
    await tester.pumpWidget(FlutterLibrary());

    expect(find.text('Refresh'), findsOneWidget);
    expect(find.text('xxxx'), findsNothing);

    //await tester.tap(find.text('Refresh'));
    //await tester.tap(find.byIcon(Icons.arrow_back));
    //await tester.tap(find.byKey(const Key('button.back')));

    await tester.pump();
  }, skip: true);
}
