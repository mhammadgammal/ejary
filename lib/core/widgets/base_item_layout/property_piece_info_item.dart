import 'package:ejary/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PropertyPieceInfoItem extends StatelessWidget {
  const PropertyPieceInfoItem({
    super.key,
    required this.infoIconPath,
    required this.infoTitle,
  });

  final String infoIconPath;
  final String infoTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.0.w,
      height: 30.0.h,
      child: Card(
        color: AppColors.background50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(infoIconPath, width: 24.0.w, height: 24.0.h),
            // SizedBox(height: 20.0),
            Text(
              infoTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.tajawal(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.gray200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
