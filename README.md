# Flutter library

TODO:
* Firebase:
https://firebase.google.com/docs/flutter/setup
https://github.com/flutter/plugins/blob/master/FlutterFire.md
https://codelabs.developers.google.com/codelabs/flutter-firebase
https://medium.com/flutterpub/enabling-firebase-cloud-messaging-push-notifications-with-flutter-39b08f2ed723
https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed

* Deep links
https://medium.com/@denisov.shureg/deep-links-and-flutter-applications-how-to-handle-them-properly-8c9865af9283

* Notifications
https://www.youtube.com/watch?v=xMeCwF5MO6w
https://www.youtube.com/watch?v=lVDO58jCiCo

* InApp Purchases:
https://www.youtube.com/watch?v=NWbkKH-2xcQ
https://android-developers.googleblog.com/2019/06/advanced-in-app-billing-handling.html

* Mock server
https://pub.dev/packages/mock_web_server
https://pub.dev/packages/jaguar

* Testing:
https://flutter.dev/docs/cookbook/testing/integration/introduction
https://medium.com/flutter-community/testing-flutter-ui-with-flutter-driver-c1583681e337
https://medium.com/flutter-community/testing-gestures-using-flutter-driver-b37981c24366
https://medium.com/flutter-community/key-learnings-from-flutter-driver-d1d35ad1402e

Guidelines:
* Use integers instead floats in paddins, margins, etc when possible
* Use single quote instead of double quote
* Use [] instead of <Widget>[]
* Use => notation for a single line function
* Use imports with 'package:...' instead of relative paths

Sanitizer:
* "
* new
* ))

Collection-if:

```dart
if (condition)
    Widget(...)
```

Spread operator
```dart
if (condition) ...[
    Widget1(...),
    Widget2(...),
    ...
]
```

Condition-for:
```dart
for (var item in list)
    Widget1(...),
```