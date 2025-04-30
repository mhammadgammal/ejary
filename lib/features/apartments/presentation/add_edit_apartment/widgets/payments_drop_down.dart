import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/theme/app_theme.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentsDropDown extends StatelessWidget {
  const PaymentsDropDown({
    super.key,
    required this.paymentsList,
    this.selectedPaymentType,
    this.onPaymentTypeChanged,
  });

  final List<String> paymentsList;
  final int? selectedPaymentType;
  final void Function(int?)? onPaymentTypeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.0.h,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Payments'.tr(context),
          textAlign: TextAlign.start,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 20.sp),
        ),
        SizedBox(
          height: 50.0.h,
          child: DropdownButtonFormField(
            value: selectedPaymentType,
            onChanged: onPaymentTypeChanged,
            dropdownColor: AppColors.background100,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.gray100,
              size: 24.0,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppTheme.appRadius),
                borderSide: BorderSide(color: AppColors.gray50, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppTheme.appRadius),
                borderSide: BorderSide(color: AppColors.gray50, width: 1.5),
              ),
              // focusColor: AppColors.background100,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppTheme.appRadius),
                borderSide: BorderSide(
                  color: AppColors.gray50,
                  style: BorderStyle.solid,
                  width: 1.5.w,
                ),
              ),
              hintText: 'select your payment type'.tr(context),
              hintStyle: TextStyle(color: AppColors.gray50, fontSize: 16.sp),
              fillColor: AppColors.background100,
              filled: true,
            ),
            items: List.generate(
              paymentsList.length,
              (index) => DropdownMenuItem(
                value: index + 1,
                child: Text(
                  paymentsList[index].tr(context),
                  style: GoogleFonts.tajawal(
                    color: AppColors.gray200,
                    fontSize: 15.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
