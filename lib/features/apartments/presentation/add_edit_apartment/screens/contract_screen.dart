import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button_with_save_icon.dart';
import 'package:ejary/core/widgets/image_picker/cubit/image_picker_cubit.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/cubit/add_edit_apartment_cubit.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/widgets/attach_file_button.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/widgets/cubit/attach_file_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditApartmentCubit, AddEditApartmentState>(
      builder: (context, state) {
        var cubit = AddEditApartmentCubit.get(context);
        return Padding(
          padding: EdgeInsets.only(bottom: 10.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.uploadPicture.tr(context),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 20.sp),
              ),
              SizedBox(height: 10.0.h),
              AttachFileButton(
                title: AppStrings.uploadContract,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 50.0.h),
              CustomFilledButtonWithSaveIcon(
                width: 343.w,
                height: 56.h,
                title: AppStrings.saveData.tr(context),
                onPressed: () async {
                  if (cubit.formKey.currentState!.validate()) {
                    if (await cubit.isUpdate()) {
                      if (context.mounted) {
                        cubit.updateApartment(
                          ImagePickerCubit.get(context).imagePath,
                          AttachFileCubit.get(context).filePath,
                        );
                      }
                    } else {
                      if (context.mounted) {
                        cubit.addApartment(
                          ImagePickerCubit.get(context).imagePath,
                          AttachFileCubit.get(context).filePath,
                        );
                      }
                    }
                  }
                },
                fontSize: 18.sp,
                padding: EdgeInsetsDirectional.only(end: 20.0.h),
              ),
              Spacer(),
              TextButton.icon(
                onPressed: () {
                  cubit.changeCurrentIndex(0);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 24.0.sp,
                  color: AppColors.primary100,
                ),
                label: Text(
                  "العوده",
                  style: GoogleFonts.tajawal(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary100,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
