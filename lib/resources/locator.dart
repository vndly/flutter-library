import 'package:flutter_library/resources/environments.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt();

void setupLocatorDev() {
  getIt.reset();
  getIt.registerSingleton<Environment>(DevEnvironment());
}

void setupLocatorProd() {
  getIt.reset();
  getIt.registerSingleton<Environment>(ProdEnvironment());
}