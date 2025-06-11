import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maham_website/pages/brands_pages/antinoopolis.dart';
import 'package:maham_website/pages/brands_pages/cartel.dart';
import 'package:maham_website/pages/brands_pages/codelytical.dart';
import 'package:maham_website/pages/brands_pages/control_lines.dart';
import 'package:maham_website/pages/brands_pages/crinkle.dart';
import 'package:maham_website/pages/brands_pages/emdad_ar.dart';
import 'package:maham_website/pages/brands_pages/emdad_en.dart';
import 'package:maham_website/pages/brands_pages/kuken.dart';
import 'package:maham_website/pages/brands_pages/pro_guard.dart';
import 'package:maham_website/pages/footer_pages/franchise.dart';
import 'package:maham_website/pages/footer_pages/jobs_applications.dart';
import 'package:maham_website/pages/footer_pages/privacy_policy.dart';
import 'package:maham_website/pages/footer_pages/terms_and_conditions.dart';
import 'package:maham_website/pages/footer_pages/usage_conditions.dart';
import 'package:maham_website/pages/header_pages/blog.dart';
import 'package:maham_website/pages/header_pages/contact.dart';
import 'package:maham_website/pages/header_pages/projects.dart';
import 'package:maham_website/pages/header_pages/skills.dart';
import 'package:maham_website/pages/home_page.dart';
import 'package:maham_website/dio_helper.dart';
import 'package:maham_website/pages/mainDesk_pages/posts_screen.dart';
import 'package:maham_website/widgets/main_desktop.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; // This comes from Flutter SDK

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
    GoRoute(
      path: '/:lang/posts',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return PostsScreen(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/codelytical',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return Codelytical(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/control_lines',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return ControlLines(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/pro_guard',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return ProGuard(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/antinoopolis',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return Antinoopolis(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/crinkle',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return Crinkle(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/kuken',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return Kuken(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/emdad',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return EmdadEn(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/إمداد',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return EmdadAr(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/cartel',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return Cartel(language: lang);
      },
    ),
    GoRoute(
      path: '/:lang/usage_conditions',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return UsageConditions(language: lang); 
      },
    ),
    GoRoute(
      path: '/:lang/terms_and_conditions',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return TermsAndConditions(language: lang); 
      },
    ),
    GoRoute(
      path: '/:lang/privacy_policy',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return PrivacyPolicy(language: lang); 
      },
    ),
    GoRoute(
      path: '/:lang/jobs_applications',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return JobsApplications(language: lang); 
      },
    ),
    GoRoute(
      path: '/:lang/franchise',
      builder: (context, state) {
        final lang = state.pathParameters['lang']!;
        return Franchise(language: lang); 
      },
    ),
  ],
);

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
      routerConfig: _router,
      // home: const HomePage(),
    );
  }
}
