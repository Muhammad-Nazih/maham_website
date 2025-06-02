// final GoRouter _router = GoRouter(
//   initialLocation: '/en',
//   routes: [
//     GoRoute(
//       path: '/:lang', // ex: /en or /ar
//       builder: (context, state) {
//         final lang = state.pathParameters['lang']!;
//         return HomePage(language: lang);
//       },
//       routes: [
//         GoRoute(
//           path: ':/en/codelytical', // ex: /en/codelytical
//           builder: (context, state) {
//             final lang = state.pathParameters['lang']!;
//             final brand = state.pathParameters['brand']!;
//             return Codelytical(language: lang, brand: brand);
//           },
//         ),
//       ],
//     ),
//   ],
// );

/* 
 دا بيكون شكل الراوت لما ابقى عايز احافظ عليه جواالهوم بيدج
  ميكونش السكيلز صفحة مستفلة كأن هتنضاف جوا الهوم بيدج
*/
// final GoRouter _router = GoRouter(
//   initialLocation: '/en',
//   routes: [
//     ShellRoute(
//       builder: (context, state, child) {
//         final lang = state.pathParameters['lang'] ?? 'en';
//         return HomePage(language: lang, child: child);
//       },
//       routes: [
//         GoRoute(
//           path: '/:lang',
//           builder: (context, state) {
//             return const MainDesktop(); // الصفحة الرئيسية
//           },
//         ),
//         GoRoute(
//           path: '/:lang/skills',
//           builder: (context, state) {
//             final lang = state.pathParameters['lang']!;
//             return Skills(language: lang); // ✅ صفحة Skills
//           },
//         ),
//         // زود هنا صفحاتك التانية زي Codelytical لو حابب
//       ],
//     ),
//   ],
// );