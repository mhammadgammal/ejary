import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button_with_arrow_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 248.w,
          height: 250.h,
          child: Card(child: Placeholder()),
        ),
        CustomFilledButtonWithArrowIcon(
          width: 248.w,
          title: AppStrings.propertyDetails.tr(context),
          fillColor: AppColors.primary100,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          onPressed: () {},
        ),
      ],
    );
  }
}
