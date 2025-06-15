import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maham_website/core/utils/dio_helper.dart';
import 'package:maham_website/router/maham_routes.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; // This comes from Flutter SDK

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  setUrlStrategy(PathUrlStrategy());
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Maham website',
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData.light(),
      routerConfig: mahamRoutes,
    );
  }
}