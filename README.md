# Flutter library

Guidelines:
* Use integers instead floats in paddins, margins, etc when possible
* Use single quote instead of double quote
* Use [] instead of <Widget>[]

TODO:
* Use SGV icons
* App icon
* Switch between different environments
* Use localized text
* Navigate to a new screen and destroy all the others behind
* Infinite scroll list view

Sanitizer:
* "
* new
* ))


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body: OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? _buildVerticalLayout()
            : _buildHorizontalLayout();
      },
    ),
  );
}

SystemChrome.setPreferredOrientations(DeviceOrientation.portraitUp);