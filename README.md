# Flutter library

TODO:
* Examples of state management with:
    - InheritedWidget
    - Redux
    - RxDart

* Multiple environments
* Mock server
    - https://pub.dev/packages/mock_web_server
    - https://pub.dev/packages/jaguar

* Enums (new and old)
```dart
class Fruit {
  static const APPLE = const Fruit._(0);
  static const BANANA = const Fruit._(1);

  static get values => [APPLE, BANANA];

  final int value;

  const Fruit._(this.value);
}
```

* Logs (https://flutter.dev/docs/testing/debugging)

* Improve RichText creation
* Intents:
    - share link
    - share file
    - send email
    - call number
    - take picture
    - select file
    - open file
    - open addres
    - open app in store
    - open web page
* Encoding:
    - base 64
    - url econding
    - sha256
    - sha512
* Lottie
* Firebase (analytics, push messages, crash reports)
* Unit tests
* End-to-End tests

Guidelines:
* Use integers instead floats in paddins, margins, etc when possible
* Use single quote instead of double quote
* Use [] instead of <Widget>[]
* Use => notation for a single line function
* Use 'var' when declaring variables in methods
* Use imports with 'package:...' instead of relative paths

Sanitizer:
* "
* new
* ))