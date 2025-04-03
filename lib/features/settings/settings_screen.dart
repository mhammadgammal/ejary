import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/di/di.dart';
import 'package:ejary/core/helpers/cache/cache_keys.dart';
import 'package:ejary/core/helpers/cache/shared_preferences/cache_helper.dart';
import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button_with_save_icon.dart';
import 'package:ejary/core/widgets/text_form_field/password_text_form_field.dart';
import 'package:ejary/core/widgets/text_form_field/phone_number_form_field.dart';
import 'package:ejary/ejary_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 45.0.w,
        end: 70.0.w,
        bottom: 45.0.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _accountSettings(context),
          SizedBox(height: 20.0.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.gray100, width: 1.0.w),
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              padding: EdgeInsetsDirectional.only(start: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 551.w,
                    height: 100.h,
                    child: PhoneNumberFormField(
                      controller: TextEditingController(),
                    ),
                  ),
                  SizedBox(
                    width: 551.w,
                    height: 100.h,
                    child: PasswordTextFormField(
                      controller: TextEditingController(),
                    ),
                  ),
                  SizedBox(
                    width: 551.w,
                    height: 100.h,
                    child: PasswordTextFormField(
                      controller: TextEditingController(),
                    ),
                  ),
                  SizedBox(height: 20.0.h),
                  CustomFilledButtonWithSaveIcon(
                    width: 343.w,
                    height: 56.h,
                    title: AppStrings.saveChanges.tr(context),
                    onPressed: () {},
                    fontSize: 18.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _accountSettings(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.accountSettings.tr(context),
          style: GoogleFonts.tajawal(
            fontSize: 40.0.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.gray200,
          ),
        ),
        TextButton.icon(
          onPressed: () {
            sl<CacheHelper>().putBool(CacheKeys.isLogged, false);
            rootNavigatorKey.currentState?.pushNamedAndRemoveUntil(
              RouteKeys.signIn,
              (route) => false,
            );
          },
          label: Text(
            AppStrings.signOut.tr(context),
            style: GoogleFonts.tajawal(
              color: AppColors.failure,
              fontSize: 24.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          icon: SvgPicture.asset(
            AppIcons.logoutIc,
            colorFilter: ColorFilter.mode(AppColors.failure, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
