import 'package:get_it/get_it.dart';
import 'package:machine_test_superlabs/src/services/local/app_cache.dart';
import 'package:machine_test_superlabs/src/services/remote/api/api_service.dart';

import '../../../config/routes/app_router.dart';


final locator = GetIt.instance;

Future<void> setupDependency() async {
  final sharedPref = SharedPref();
  await sharedPref.init();

  locator
    ..registerSingleton<SharedPref>(sharedPref)
    ..registerSingleton<NavigationService>(NavigationService())
    ..registerLazySingleton<DioApiService>(() => DioApiService());
}
