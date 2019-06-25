class DevEnvironment extends Environment {
  @override
  String get name => 'dev';

  @override
  String get path => 'http://dev-api.com';
}

class ProdEnvironment extends Environment {
  @override
  String get name => 'prod';

  @override
  String get path => 'http://prod-api.com';
}

abstract class Environment {
  String get name;

  String get path;
}
