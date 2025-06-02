import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maham_website/pages/brands_pages/codelytical.dart';
import 'package:maham_website/pages/header_pages/blog.dart';
import 'package:maham_website/pages/header_pages/contact.dart';
import 'package:maham_website/pages/header_pages/projects.dart';
import 'package:maham_website/pages/header_pages/skills.dart';
import 'package:maham_website/pages/home_page.dart';
import 'package:maham_website/dio_helper.dart';
import 'package:maham_website/widgets/main_desktop.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';  // This comes from Flutter SDK


final GoRouter _router = GoRouter(
  initialLocation: '/en',
  routes: [
    // 🟢 ShellRoute - بيحتوي بس على الهوم
    ShellRoute(
      builder: (context, state, child) {
        final lang = state.pathParameters['lang'] ?? 'en';
        return HomePage(language: lang, child: child);
      },
      routes: [
        GoRoute(
          path: '/:lang',
          builder: (context, state) {
            return const MainDesktop();
          },
        ),
      ],
    ),

    // 🟢 skills page - صفحة مستقلة
    GoRoute(
      path: '/:lang/skills',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return Skills(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/projects',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return Projects(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/blog',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return Blog(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/contact',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return Contact(language: lang);
      },
    ),
    // GoRoute(
    //   path: '/:lang/skills',
    //   builder: (context, state) {
    //     final lang = state.pathParameters['lang']!;
    //     return Skills(language: lang);
    //   },
    // ),
    // GoRoute(
    //   path: '/:lang/skills',
    //   builder: (context, state) {
    //     final lang = state.pathParameters['lang']!;
    //     return Skills(language: lang);
    //   },
    // ),
    // GoRoute(
    //   path: '/:lang/skills',
    //   builder: (context, state) {
    //     final lang = state.pathParameters['lang']!;
    //     return Skills(language: lang);
    //   },
    // ),
    // GoRoute(
    //   path: '/:lang/skills',
    //   builder: (context, state) {
    //     final lang = state.pathParameters['lang']!;
    //     return Skills(language: lang);
    //   },
    // ),
    // GoRoute(
    //   path: '/:lang/skills',
    //   builder: (context, state) {
    //     final lang = state.pathParameters['lang']!;
    //     return Skills(language: lang);
    //   },
    // ),
    // GoRoute(
    //   path: '/:lang/skills',
    //   builder: (context, state) {
    //     final lang = state.pathParameters['lang']!;
    //     return Skills(language: lang);
    //   },
    // ),
    // GoRoute(
    //   path: '/:lang/skills',
    //   builder: (context, state) {
    //     final lang = state.pathParameters['lang']!;
    //     return Skills(language: lang);
    //   },
    // ),
    // GoRoute(
    //   path: '/:lang/skills',
    //   builder: (context, state) {
    //     final lang = state.pathParameters['lang']!;
    //     return Skills(language: lang);
    //   },
    // ),
    // GoRoute(
    //   path: '/:lang/skills',
    //   builder: (context, state) {
    //     final lang = state.pathParameters['lang']!;
    //     return Skills(language: lang);
    //   },
    // ),
  ],
);

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  setUrlStrategy(PathUrlStrategy());
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: const MyApp()
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
      routerConfig: _router,
      // home: const HomePage(),
    );
  }
}
