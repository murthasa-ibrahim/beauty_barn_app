import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test_superlabs/config/dependency_injection/dependency_injection.dart';
import 'package:machine_test_superlabs/config/theme/theme.dart';
import 'package:machine_test_superlabs/src/core/bloc_providers/app_bloc_providers.dart';

import 'config/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await setupDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: appBlocProviders,
      child: ScreenUtilInit(
        minTextAdapt: false,
        designSize: const Size(402, 874),
        child: MaterialApp.router(
          title: 'UTURN',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          routerConfig: locator<NavigationService>().router,
        ),
      ),
    );
  }
}
