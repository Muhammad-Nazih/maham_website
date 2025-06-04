// final GoRouter _router = GoRouter(
//   initialLocation: '/en',
//   routes: [
//     // 🟢 ShellRoute - بيحتوي بس على الهوم
//     ShellRoute(
//       builder: (context, state, child) {
//         final lang = state.pathParameters['lang'] ?? 'en';
//         return HomePage(language: lang, child: child);
//       },
//       routes: [
//         GoRoute(
//           path: '/:lang',
//           builder: (context, state) {
//             return const MainDesktop();
//           },
//         ),
//       ],
//     ),

//     // 🟢 skills page - صفحة مستقلة
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//     GoRoute(
//       path: '/:lang/skills',
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return Skills(language: lang);
//       },
//     ),
//   ],
// );