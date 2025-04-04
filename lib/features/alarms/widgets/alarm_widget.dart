import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AlarmWidget extends StatelessWidget {
  const AlarmWidget({super.key, required this.date, required this.renterName});

  final DateTime date;
  final String renterName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background100,
        borderRadius: BorderRadius.circular(8.0.r),
        border: Border.all(color: AppColors.gray200, width: 1.0.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
      margin: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.0.h),
      child: ListTile(
        leading: Container(
          width: 24.0.w,
          height: 24.0.h,
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: BorderRadius.circular(2.0.r),
          ),
          child: Icon(Icons.close, color: Colors.white),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.alarmMessage.tr(context),
              style: GoogleFonts.tajawal(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary100,
              ),
            ),
            Text(
              DateFormat('d/M/yyyy الساعة h:mm a', 'ar').format(date),
              style: GoogleFonts.tajawal(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.gray200,
              ),
            ),
          ],
        ),
        // trailing:
        // Text(
        //   DateFormat('d/M/yyyy الساعة h:mm a', 'ar').format(date),
        //   style: GoogleFonts.tajawal(
        //     fontSize: 13.sp,
        //     fontWeight: FontWeight.w500,
        //     color: AppColors.gray200,
        //   ),
        // ),
        subtitle: Text(
          '${AppStrings.renterName.tr(context)} $renterName ${AppStrings.timeMessage.tr(context)}',
          style: GoogleFonts.tajawal(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.gray200,
          ),
        ),
      ),
    );
  }
}
