import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maham_website/pages/brands_pages/codelytical.dart';
import 'package:maham_website/pages/home_page.dart';
import 'package:maham_website/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: const MyApp()
  ),
  );
}

final GoRouter _router = GoRouter(
  initialLocation: '/en',
  routes: [
    GoRoute(
      path: '/:lang', // ex: /en or /ar
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return HomePage(language: lang);
      },
      routes: [
        GoRoute(
          path: ':/en/codelytical', // ex: /en/codelytical
          builder: (context, state) {
            final lang = state.pathParameters['lang']!;
            final brand = state.pathParameters['brand']!;
            return Codelytical(language: lang, brand: brand);
          },
        ),
      ],
    ),
  ],
);


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Maham website',
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData.light(),
      routerConfig: _router,
      // home: const HomePage(),
    );
  }
}
