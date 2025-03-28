import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/theme/app_theme.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/widgets/buttons/custom_outlined_button_with_border.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button.dart';
import 'package:ejary/core/widgets/text_form_field/columned_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          (context) => AlertDialog(
            backgroundColor: AppColors.white,
            icon: SvgPicture.asset(AppIcons.successIc),
            title: Text(
              header.tr(context),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.black,
                fontSize: 20.0.sp,
              ),
            ),
            content: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.black,
                fontSize: 15.0.sp,
              ),
            ),
            actions: [
              CustomFilledButton(
                height: 50.0.h,
                onPressed: () => Navigator.of(context).pop(),
                title: 'OK'.tr(context),
              ),
            ],
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
                          onPressed: onYes,
                        ),
                      ),

                      Expanded(
                        child: CustomOutlinedButtonWithBorder(
                          title: 'Cancel'.tr(context),
                          onPressed: onCancel,
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
