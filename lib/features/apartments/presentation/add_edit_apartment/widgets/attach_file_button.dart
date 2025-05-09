import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/assets/app_lottie.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/widgets/buttons/custom_outlined_button_with_border.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/widgets/cubit/attach_file_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class AttachFileButton extends StatelessWidget {
  const AttachFileButton({
    super.key,
    this.width,
    this.height,
    required this.title,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
  });

  final double? width;
  final double? height;
  final String title;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttachFileCubit, AttachFileState>(
      builder: (context, state) {
        return AttachFileCubit.get(context).fileName.isEmpty
            ? CustomOutlinedButtonWithBorder(
              width: (width ?? 250.0).w,
              height: (height ?? 50.0).h,
              onPressed: () {
                AttachFileCubit.get(context).pickProfilePic();
              },
              title: title.tr(context),
              fontSize: fontSize,
              fontWeight: fontWeight,
              titleColor: AppColors.primary100,
              borderColor: AppColors.primary100,
              icon: SvgPicture.asset(
                AppIcons.downloadIc,
                colorFilter: ColorFilter.mode(
                  AppColors.primary100,
                  BlendMode.srcIn,
                ),
              ),
            )
            : Row(
              children: [
                CustomFilledButton(
                  width: (width ?? 250.0).w,
                  height: (height ?? 50.0).h,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  title: AttachFileCubit.get(context).fileName,
                  fillColor: AppColors.success,
                  icon: Lottie.asset(AppLottie.success, repeat: false),
                  onPressed: () {
                    AttachFileCubit.get(context).pickProfilePic();
                  },
                ),
                SizedBox(width: 20.0.w),
                IconButton(
                  onPressed: () {
                    AttachFileCubit.get(context).changeContractVisibility();
                  },
                  style: ButtonStyle(
                    backgroundBuilder:
                        (context, states, child) => Container(
                          width: 48.0.w,
                          height: 48.0.h,
                          decoration: BoxDecoration(
                            // color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0.r),
                            border: Border.all(
                              color: AppColors.primary100,
                              width: 1.0.w,
                            ),
                          ),
                          child: child,
                        ),
                  ),
                  icon: SvgPicture.asset(
                    AttachFileCubit.get(context).showContract
                        ? AppIcons.hidePasswordIc
                        : AppIcons.showPasswordIc,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary100,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            );
      },
    );
  }
}
