import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maham_website/core/styles/style.dart';
import 'package:maham_website/core/utils/dio_helper.dart';
import 'package:maham_website/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  @override
  Widget build(BuildContext context) {
    final currentLang = context.locale.languageCode;

    return Container(
      height: 50.0,
      margin: EdgeInsets.fromLTRB(10, 5, 20, 5),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: () {
              context.go('/$currentLang');
            },
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () async {
              final newLocale =
                  context.locale.languageCode == 'en'
                      ? const Locale('ar')
                      : const Locale('en');

              // 1. Get current path and prepare new path
              final currentPath = GoRouterState.of(context).uri.path;
              final newPath = currentPath.replaceFirst(
                '/${context.locale.languageCode}',
                '/${newLocale.languageCode}',
              );

              // 2. Change the locale FIRST to trigger rebuild
              await context.setLocale(newLocale);

              // ✅ هنا: علشان اللغة تتبعت في كل طلب
              DioHelper.currentLanguage = newLocale.languageCode;
              
              // 3. Wait for the next frame to ensure widgets rebuilt
              await Future.delayed(Duration.zero);

              // 4. Update the URL without triggering rebuild
              context.go(newPath);
            },
            child: Row(
              children: [
                Icon(Icons.language, color: Colors.black,),
                SizedBox(width: 10.0),
                Text(
                  'language'.tr(),
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onMenuTap,
            icon: Icon(Icons.menu, color: Colors.white),
          ),
          SizedBox(width: 15.0),
        ],
      ),
    );
  }
}
