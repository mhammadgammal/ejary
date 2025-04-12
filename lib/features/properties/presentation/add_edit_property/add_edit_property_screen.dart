import 'package:ejary/core/app_container/cubit/app_cubit.dart';
import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button_with_save_icon.dart';
import 'package:ejary/core/widgets/dialog_helper/dialog_helper.dart';
import 'package:ejary/core/widgets/image_picker/cubit/image_picker_cubit.dart';
import 'package:ejary/core/widgets/image_picker/image_picker.dart';
import 'package:ejary/core/widgets/text_form_field/columned_text_form_field.dart';
import 'package:ejary/features/properties/presentation/add_edit_property/cubit/add_edit_property_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEditPropertyScreen extends StatelessWidget {
  const AddEditPropertyScreen({super.key});

  @override
  Widget build(BuildContext buildContext) {
    return BlocConsumer<AddEditPropertyCubit, AddEditPropertyState>(
      listener: (context, state) {
        if (state is AddEditPropertySuccess) {
          DialogHelper.showSuccessDialog(
            context: context,
            header: 'property_added_successfully'.tr(context),
          );
          AppCubit.get(context).changeTabIndex(0);
        } else if (state is AddEditPropertyFailure) {
          DialogHelper.showFailureDialog(context, state.message);
        }
      },
      builder: (context, state) {
        var cubit = AddEditPropertyCubit.get(context);
        return Container(
          padding: EdgeInsetsDirectional.only(
            start: 45.0.w,
            end: 70.0.w,
            bottom: 45.0.h,
          ),
          child: Form(
            key: cubit.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _header(context, cubit.isEditMode),
                SizedBox(height: 20.0.h),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.gray100,
                        width: 1.0.w,
                      ),
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    padding: EdgeInsetsDirectional.only(
                      start: 20.0.w,
                      top: 20.0.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ColumnedTextFormField(
                                      title: AppStrings.propertyNo.tr(
                                          context),
                                      controller:
                                      cubit.propertyNumberController,
                                      inputType: TextInputType.number,
                                      hint:
                                      '${AppStrings.enter.tr(
                                          context)} ${AppStrings.propertyNo
                                          .tr(
                                          context)}',
                                      validate: cubit.validate,
                                    ),
                                  ),
                                  SizedBox(width: 20.0.w),
                                  Expanded(
                                    child: ColumnedTextFormField(
                                      title: AppStrings.districtName.tr(
                                        context,
                                      ),
                                      controller: cubit
                                          .districtNameController,
                                      inputType: TextInputType.number,
                                      hint:
                                      '${AppStrings.enter.tr(
                                          context)} ${AppStrings.districtName
                                          .tr(context)}',
                                      validate: cubit.validate,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0.h),
                              CustomFilledButtonWithSaveIcon(
                                width: 343.w,
                                height: 56.h,
                                title: AppStrings.saveData.tr(context),
                                onPressed: () {
                                  if (cubit.formKey.currentState!
                                      .validate()) {
                                    cubit.addPropertyToDb(
                                      context,
                                      picturePath:
                                      ImagePickerCubit
                                          .get(
                                        context,
                                      )
                                          .imagePath,
                                    );
                                  }
                                },
                                fontSize: 18.sp,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 280.w,
                          height: 355.h,
                          child: ImagePicker(
                            title: AppStrings.addPropertyImage.tr(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _header(BuildContext context, bool isEditMode) =>
      Row(
        children: [
          if (isEditMode)
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(
                AppIcons.greenArrowRight,
                width: 48.0.w,
                height: 48.0.h,
              ),
            ),
          if (isEditMode)
            SizedBox(width: 10.0.w),
          Text(
            (isEditMode ? AppStrings.editProperty : AppStrings.addProperty).tr(
                context),
            style: GoogleFonts.tajawal(
              color: AppColors.black,
              fontSize: 40.0.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );
}
