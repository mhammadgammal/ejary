import 'package:ejary/core/app_container/cubit/app_cubit.dart';
import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyPropertiesState extends StatelessWidget {
  const EmptyPropertiesState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 120.0.h),
      child: Column(
        spacing: 30.0.h,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            width: 162.5.w,
            height: 150.0.h,
            AppIcons.homeModernIc,
            colorFilter: ColorFilter.mode(AppColors.gray50, BlendMode.srcIn),
          ),
          Text(
            'No properties currently..add it from here'.tr(context),
            style: GoogleFonts.tajawal(
              color: AppColors.gray50,
              fontSize: 32.0.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          CustomFilledButton(
            width: 248.w,
            height: 48.h,
            title: 'add_new_property'.tr(context),
            fillColor: AppColors.secondary,
            icon: SvgPicture.asset(
              AppIcons.plus,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
            iconAlignment: IconAlignment.start,
            onPressed: () {
              AppCubit.get(context).changeTabIndex(1);
            },
          ),
        ],
      ),
    );
  }
}
