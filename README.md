# Flutter library

TODO:
* Examples of state management with:
    - InheritedWidget
    - Redux
    - RxDart

Create SuperStateWidget
SperStateWidget(
    state: MySuperState(...)
    builder: (context, model, events)
)

class MySuperState extends SuperState {}

class SuperStateWidget<S extends SuperState>
{
    final S state;

    state.setParent(this);
}

* Multiple environments
* Use localized text
* Navigate to a new screen and destroy all the others behind
* Infinite scroll list view
* Firebase (analytics, push messages, crash reports)
* Logs
* Shared preferences (encrypted)
* Database
* Date and number formatters
* Facebook and Google login
* Unit tests
* End-to-End tests

Guidelines:
* Use integers instead floats in paddins, margins, etc when possible
* Use single quote instead of double quote
* Use [] instead of <Widget>[]
* Use => notation for a single line function
* Use 'var' when declaring variables in method

Sanitizer:
* "
* new
* ))