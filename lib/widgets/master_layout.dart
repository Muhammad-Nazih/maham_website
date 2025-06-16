import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maham_website/core/constants/size.dart';
import 'package:maham_website/widgets/footer.dart';
import 'package:maham_website/widgets/header_desktop.dart';
import 'package:maham_website/widgets/header_mobile.dart';
import 'package:maham_website/widgets/drawer_mobile.dart';

class MasterLayout extends StatelessWidget {
  final Widget child;

  const MasterLayout({super.key, required this.child});

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final isDesktop = constraints.maxWidth >= kMinDesktopWidth;

        return Scaffold(
          key: _scaffoldKey,
          endDrawer: isDesktop ? null : const DrawerMobile(),
          body: Column(
            children: [
              isDesktop
                  ? const HeaderDesktop()
                  : HeaderMobile(
                      onLogoTap: () {
                        context.go('/${context.locale.languageCode}');
                      },
                      onMenuTap: () {
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),
              Expanded(child: child),
              Footer(key: ValueKey(context.locale.languageCode)),
            ],
          ),
        );
      },
    );
  }
}
