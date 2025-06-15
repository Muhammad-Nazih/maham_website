import 'package:go_router/go_router.dart';
import 'package:maham_website/pages/home_page.dart';
import 'package:maham_website/widgets/main_desktop.dart';

// Header Pages
import 'package:maham_website/pages/header_pages/skills.dart';
import 'package:maham_website/pages/header_pages/projects.dart';
import 'package:maham_website/pages/header_pages/blog.dart';
import 'package:maham_website/pages/header_pages/contact.dart';

// Brands Pages
import 'package:maham_website/pages/brands_pages/codelytical.dart';
import 'package:maham_website/pages/brands_pages/control_lines.dart';
import 'package:maham_website/pages/brands_pages/pro_guard.dart';
import 'package:maham_website/pages/brands_pages/antinoopolis.dart';
import 'package:maham_website/pages/brands_pages/crinkle.dart';
import 'package:maham_website/pages/brands_pages/kuken.dart';
import 'package:maham_website/pages/brands_pages/emdad_en.dart';
import 'package:maham_website/pages/brands_pages/emdad_ar.dart';
import 'package:maham_website/pages/brands_pages/cartel.dart';

// Footer Pages
import 'package:maham_website/pages/footer_pages/usage_conditions.dart';
import 'package:maham_website/pages/footer_pages/terms_and_conditions.dart';
import 'package:maham_website/pages/footer_pages/privacy_policy.dart';
import 'package:maham_website/pages/footer_pages/job_applications.dart';
import 'package:maham_website/pages/footer_pages/franchise.dart';

final GoRouter mahamRoutes = GoRouter(
  initialLocation: '/en',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final lang = state.pathParameters['lang'] ?? 'en';
        return HomePage(language: lang, child: child);
      },
      routes: [
        GoRoute(
          path: '/:lang',
          builder: (context, state) => const MainDesktop(),
        ),
      ],
    ),
    // 🟩 Header Pages
    GoRoute(path: '/:lang/skills', builder: (c, s) => Skills(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/projects', builder: (c, s) => Projects(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/blog', builder: (c, s) => Blog(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/contact', builder: (c, s) => Contact(language: s.pathParameters['lang']!)),

    // 🟨 Brands Pages
    GoRoute(path: '/:lang/codelytical', builder: (c, s) => Codelytical(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/control_lines', builder: (c, s) => ControlLines(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/pro_guard', builder: (c, s) => ProGuard(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/antinoopolis', builder: (c, s) => Antinoopolis(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/crinkle', builder: (c, s) => Crinkle(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/kuken', builder: (c, s) => Kuken(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/emdad', builder: (c, s) => EmdadEn(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/إمداد', builder: (c, s) => EmdadAr(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/cartel', builder: (c, s) => Cartel(language: s.pathParameters['lang']!)),

    // 🟥 Footer Pages
    GoRoute(path: '/:lang/usage_conditions', builder: (c, s) => UsageConditions(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/terms_and_conditions', builder: (c, s) => TermsAndConditions(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/privacy_policy', builder: (c, s) => PrivacyPolicy(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/job_applications', builder: (c, s) => JobApplications(language: s.pathParameters['lang']!)),
    GoRoute(path: '/:lang/franchise', builder: (c, s) => Franchise(language: s.pathParameters['lang']!)),
  ],
);
