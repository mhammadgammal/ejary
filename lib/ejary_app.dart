import 'package:ejary/core/router/app_router.dart';
import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/core/theme/app_theme.dart';
import 'package:ejary/core/utils/localization/app_localization.dart';
import 'package:ejary/core/utils/localization/localize_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart' show sl;

class EjaryApp extends StatelessWidget {
  const EjaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1440, 1024),
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            routes: routes,
            initialRoute: RouteKeys.signIn,
            locale: sl<AppLanguage>().appLocal,
            supportedLocales: LocalizeConstants.supportedLocales,
            localizationsDelegates: LocalizeConstants.delegates,
          ),
    );
  }
}
