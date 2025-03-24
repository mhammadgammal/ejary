import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/widgets/dialog_helper/custom_dialog.dart';

abstract class DialogHelper {
  static void showDatePickerDialog(
    context, {
    bool Function(DateTime)? predicateDaysCallback,
    required void Function(DateTime) onDateSelected,
  }) => showDatePicker(
    context: context,
    firstDate: DateTime.now(),
    lastDate: DateTime.parse(
      '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-30',
    ),
    barrierDismissible: false,
    selectableDayPredicate: predicateDaysCallback,
    builder:
        (context, child) => Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.dark(primary: AppColors.white),
          ),
          child: child!,
        ),
  ).then((selectedDate) {
    if (selectedDate != null) {
      onDateSelected(selectedDate);
    }
  });

  static void showErrorDialog(
    BuildContext context, {
    required String message,
    Icon? icon,
    String header = 'Error',
    List<Widget>? actionButtons,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialogWidget(
          title: header,
          content: message,
          icon: icon ?? Icon(Icons.error_outline, size: 50.h),
          actionButtons:
              actionButtons ??
              [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'ok',
                    style: TextStyle(color: Colors.white, fontSize: 30.0.sp),
                  ),
                ),
              ],
        );
      },
    );
  }

  static void showSuccessDialog(
    BuildContext context, {
    required String header,
    required String message,
    Icon? icon,
    List<Widget>? actionButtons,
  }) => showDialog(
    context: context,
    builder:
        (context) => CustomDialogWidget(
          title: header,
          content: message,
          icon: icon ?? Icon(Icons.done, size: 50.h),
          actionButtons:
              actionButtons ??
              [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'ok',
                  ),
                ),
              ],
        ),
  );

  static void showProgressDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) => const CircularProgressIndicator(),
  );

  static void showCancelConfirm(
    BuildContext context, {
    required void Function() onPositivePressed,
    void Function()? onNegativePressed,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => CustomDialogWidget(
            title: 'Cancel Confirmation',
            content: 'Are you sure you want to cancel this item?',
            icon: Icon(Icons.info_outline_rounded, size: 50.0.h),
            actionButtons: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onPositivePressed();
                },
                child: Text(
                  'Yes',
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onNegativePressed?.call();
                },
                child: Text(
                  'No',
                ),
              ),
            ],
          ),
    );
  }
}
