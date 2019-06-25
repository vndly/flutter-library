import 'package:flutter_library/environments.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = new GetIt();

void setupLocatorDev() {
  getIt.registerSingleton<Environment>(DevEnvironment());
}

void setupLocatorProd() {
  getIt.registerSingleton<Environment>(ProdEnvironment());
}
