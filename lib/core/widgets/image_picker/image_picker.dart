import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/widgets/image_picker/cubit/image_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePickerCubit(),
      child: BlocBuilder<ImagePickerCubit, ImagePickerState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 264.w,
                    height: 285.h,
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: SvgPicture.asset(
                        AppIcons.picture,
                        width: 48.0.w,
                        height: 48.0.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        AppIcons.pencil,
                        width: 24.0.w,
                        height: 24.0.h,
                      ),

                      Text(
                        title,
                        style: GoogleFonts.cairo(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary100,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
