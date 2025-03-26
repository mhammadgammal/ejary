import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EjaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EjaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.0.h,
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: Text(AppStrings.homePage.tr(context)),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(95.0.h);
}
