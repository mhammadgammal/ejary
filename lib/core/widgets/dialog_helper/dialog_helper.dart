import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/assets/app_lottie.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/theme/app_theme.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/widgets/buttons/custom_outlined_button_with_border.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button.dart';
import 'package:ejary/core/widgets/text_form_field/columned_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

abstract class DialogHelper {
  static void showFailureDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: SvgPicture.asset(AppIcons.failureIc),
            title: const Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  /// shows a dialog indicates success state or action happens
  /// \param context  context The BuildContext to show the dialog in.
  /// \param header The header text to display in the dialog. Defaults to 'Success'. It's translated
  /// \param message  The message text to display in the dialog. Defaults to an empty string. Not translated
  static void showSuccessDialog({
    required BuildContext context,
    String header = 'Success',
    String message = '',
  }) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            child: Container(
              width: 556.0.w,
              height: 341.0.h,
              padding: EdgeInsets.symmetric(),
              decoration: BoxDecoration(
                color: AppColors.background50,
                borderRadius: BorderRadius.circular(16.0.r),
              ),
              child: Column(
                spacing: 20.0.h,
                children: [
                  SizedBox(
                    width: 150.0.w,
                    height: 150.0.h,
                    child: Lottie.asset(AppLottie.success),
                  ),
                  Text(
                    header.tr(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.black,
                      fontSize: 40.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.black,
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // CustomFilledButton(
                  //   height: 50.0.h,
                  //   onPressed: () => Navigator.of(context).pop(),
                  //   title: 'OK'.tr(context),
                  // ),
                ],
              ),
            ),
          ),
    );
  }

  static void deleteDialog(
    context,
    void Function() onYes,
    void Function() onCancel,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            child: Container(
              width: 600.0.w,
              height: 250.0.h,
              padding: EdgeInsets.all(20.0.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppTheme.appRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 43.w,
                    height: 43.w,
                    child: SvgPicture.asset(AppIcons.failureIc),
                  ),
                  Text(
                    'Are you sure you want to delete employee'.tr(context),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 24.sp),
                  ),
                  Text(
                    'If you delete you won\'t restore data, and you will add data manually'
                        .tr(context),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 18.sp),
                  ),
                  Row(
                    spacing: 10.0.w,
                    children: [
                      Expanded(
                        child: CustomFilledButton(
                          title: 'Delete'.tr(context),
                          fillColor: AppColors.failure,
                          onPressed: () {
                            onYes();
                            Navigator.pop(context);
                          },
                        ),
                      ),

                      Expanded(
                        child: CustomOutlinedButtonWithBorder(
                          title: 'Cancel'.tr(context),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  static void showFilterEmployeeDialog(
    context, {
    required TextEditingController nameFilter,
    required TextEditingController jobFilter,
    required TextEditingController workingDays,
    required TextEditingController workingHours,
    required TextEditingController identity,
    required Future<void> Function() onFilterPressed,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            child: Container(
              width: 600.w,
              height: 450.h,
              padding: EdgeInsets.symmetric(
                horizontal: 30.0.w,
                vertical: 30.0.h,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
                borderRadius: BorderRadius.circular(AppTheme.appRadius),
              ),
              child: Row(
                spacing: 10.0.h,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ColumnedTextFormField(
                          title: 'Employee Name'.tr(context),
                          controller: nameFilter,
                          inputType: TextInputType.text,
                        ),
                        ColumnedTextFormField(
                          title: 'Working days'.tr(context),
                          controller: workingDays,
                          inputType: TextInputType.text,
                        ),
                        ColumnedTextFormField(
                          title: 'Identity'.tr(context),
                          controller: identity,
                          inputType: TextInputType.text,
                        ),
                        Spacer(),
                        CustomFilledButton(
                          onPressed: () => onFilterPressed(),
                          title: 'Search'.tr(context),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ColumnedTextFormField(
                          title: 'job title'.tr(context),
                          controller: jobFilter,
                          inputType: TextInputType.text,
                        ),
                        ColumnedTextFormField(
                          title: 'Working days'.tr(context),
                          controller: workingDays,
                          inputType: TextInputType.text,
                        ),
                        Spacer(),
                        CustomOutlinedButtonWithBorder(
                          onPressed: () => Navigator.pop(context),
                          title: 'Cancel'.tr(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
