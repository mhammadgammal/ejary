import 'package:ejary/core/helpers/cache/cache_keys.dart';
import 'package:ejary/core/helpers/cache/shared_preferences/cache_helper.dart';
import 'package:ejary/core/router/app_router.dart';
import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/core/theme/app_theme.dart';
import 'package:ejary/core/utils/localization/app_localization.dart';
import 'package:ejary/core/utils/localization/localize_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart' show sl;

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class EjaryApp extends StatelessWidget {
  const EjaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1440, 1024),
      builder:
          (context, child) => MaterialApp(
            navigatorKey: rootNavigatorKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            routes: routes,
            initialRoute:
                (sl<CacheHelper>().getBool(key: CacheKeys.isLogged) ?? false)
                    ? RouteKeys.home
                    : RouteKeys.signIn,
            locale: sl<AppLanguage>().appLocal,
            supportedLocales: LocalizeConstants.supportedLocales,
            localizationsDelegates: LocalizeConstants.delegates,
          ),
    );
  }
}
