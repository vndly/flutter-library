import 'package:flutter_library/environments.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt();

void setupLocatorDev() {
  getIt.registerSingleton<Environment>(DevEnvironment());
}

void setupLocatorProd() {
  getIt.registerSingleton<Environment>(ProdEnvironment());
}
