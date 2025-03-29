import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/widgets/buttons/custom_outlined_button_with_border.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/widgets/cubit/attach_file_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        return CustomOutlinedButtonWithBorder(
          width: (width ?? 250.0).w,
          height: (height ?? 50.0).h,
          onPressed: () {
            AttachFileCubit.get(context).pickProfilePic();
          },
          title:
              AttachFileCubit.get(context).fileName.isEmpty
                  ? title.tr(context)
                  : AttachFileCubit.get(context).fileName,
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
        );
      },
    );
  }
}
