class DevEnvironment extends Environment {
  @override
  String get name => 'dev';

  @override
  String get path => 'http://dev-api.com';

  @override
  bool get isProd => false;
}

class ProdEnvironment extends Environment {
  @override
  String get name => 'prod';

  @override
  String get path => 'http://prod-api.com';

  @override
  bool get isProd => true;
}

abstract class Environment {
  String get name;

  String get path;

  bool get isProd;
}
