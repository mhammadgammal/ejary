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
    return ListTile(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.close, color: Colors.white),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.gray100),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          ),
        ),
      ),
      title: Text(
        AppStrings.alarmMessage.tr(context),
        style: GoogleFonts.tajawal(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primary100,
        ),
      ),
      trailing: Text(
        DateFormat('d/M/yyyy الساعة h:mm a', 'ar').format(date),
        style: GoogleFonts.tajawal(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.gray200,
        ),
      ),
      subtitle: Text(
        '${AppStrings.renterName.tr(context)} $renterName ${AppStrings.timeMessage.tr(context)}',
        style: GoogleFonts.tajawal(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.gray200,
        ),
      ),
    );
  }
}