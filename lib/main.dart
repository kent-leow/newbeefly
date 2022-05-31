import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbeefly/core/router.dart';
import 'package:newbeefly/core/services/translation_service.dart';
import 'package:newbeefly/shared/constant/constants.dart';
import 'package:newbeefly/shared/constant/themes.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService().loadAssets();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await runZonedGuarded<Future<void>>(
    () async {
      runApp(const MyApp());
    },
    (exception, stackTrace) async {
      await _reportError(exception, stackTrace);
    },
  );
}

Future<void> _reportError(dynamic exception, dynamic stackTrace) async {
  if (kDebugMode) {
    print('--------------------------Exception--------------------------');
    print(exception);
    print('--------------------------StackTrace--------------------------');
    print(stackTrace);
  } else {
    //await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
  }
  // Get.toNamed(RouteConfig.errorView,
  //     arguments: ErrorViewArgs(message: exception));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteConfig.getDefaultView(),
      unknownRoute: RouteConfig.notFoundPage,
      getPages: RouteConfig.getPages,
      defaultTransition: RouteConfig.defaultTransition,
      transitionDuration: RouteConfig.defaultTransitionDuration,
      initialBinding: RouteConfig.getInitialBindings(),
      title: 'NewbeeFly',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.system,
      locale: Constants.defaultLocale,
      fallbackLocale: Constants.defaultLocale,
      translations: TranslationService(),
    );
  }
}
