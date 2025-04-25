import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/date_picker.dart';
import 'package:ejary/core/widgets/dialog_helper/dialog_helper.dart';
import 'package:ejary/core/widgets/image_picker/image_picker.dart';
import 'package:ejary/core/widgets/text_form_field/columned_text_form_field.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/cubit/add_edit_apartment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ApartmentDetailsScreen extends StatelessWidget {
  const ApartmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddEditApartmentCubit, AddEditApartmentState>(
      listener: (context, state) {
        if (state is AddRentedApartmentSuccessState) {
          DialogHelper.showSuccessDialog(
            context: context,
            header: AppStrings.saveData.tr(context),
            message: "You will be notified before renter contract ends".tr(
              context,
            ),
          );
          Navigator.pop(context);
        } else if (state is UpdateRentedApartmentSuccessState) {
          DialogHelper.showSuccessDialog(
            context: context,
            header: AppStrings.saveChangesSuccess.tr(context),
          );
          Navigator.pop(context);
        }

        if (state is DeleteSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = AddEditApartmentCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ColumnedTextFormField(
                          title: AppStrings.renterName.tr(context),
                          controller: cubit.renterNameController,
                          inputType: TextInputType.text,
                          hint:
                              '${AppStrings.enter.tr(context)} ${AppStrings.renterName.tr(context)}',
                          validate: cubit.validate,
                        ),
                      ),
                      SizedBox(width: 20.0.w),
                      Expanded(
                        child: ColumnedTextFormField(
                          title: AppStrings.phoneNumber.tr(context),
                          controller: cubit.phoneNumberController,
                          inputType: TextInputType.number,
                          icon: Padding(
                            padding: EdgeInsets.only(top: 8.0.h, right: 10.0.w),
                            child: Text(
                              '+996 |',
                              style: GoogleFonts.tajawal(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0.sp,
                                color: AppColors.gray100,
                              ),
                            ),
                          ),
                          validate: cubit.validate,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ColumnedTextFormField(
                          title: AppStrings.rentType.tr(context),
                          controller: cubit.rentTypeController,
                          inputType: TextInputType.text,
                          hint: 'Annual or Monthly ?'.tr(context),
                          validate: cubit.validate,
                        ),
                      ),
                      SizedBox(width: 20.0.w),
                      Expanded(
                        child: ColumnedTextFormField(
                          title: AppStrings.allRentValue.tr(context),
                          controller: cubit.totalRentValueController,
                          inputType: TextInputType.number,
                          onChanged: (_) => cubit.calcRemainingValue(),
                          hint:
                              '${AppStrings.enter.tr(context)} ${AppStrings.allRentValue.tr(context)}',
                          validate: cubit.validate,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ColumnedTextFormField(
                          title: AppStrings.paid.tr(context),
                          controller: cubit.paidValueController,
                          inputType: TextInputType.text,
                          onChanged: (_) => cubit.calcRemainingValue(),
                          hint: 'Write paid value from renter'.tr(context),
                          validate: cubit.validate,
                        ),
                      ),
                      SizedBox(width: 20.0.w),
                      Expanded(
                        child: ColumnedTextFormField(
                          title: AppStrings.remaining.tr(context),
                          controller: cubit.remainingValueController,
                          inputType: TextInputType.number,
                          hint: 'Here value of remaining rent automatically'.tr(
                            context,
                          ),
                          validate: cubit.validate,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: DatePicker(
                          datePickerLabel: AppStrings.contractStartDate.tr(
                            context,
                          ),
                          datePickerController:
                              cubit.contractStartDateController,
                          datePickerHint: '0/0/0000',
                          validation: "هذا الحقل مطلوب",
                        ),
                      ),
                      SizedBox(width: 20.0.w),
                      Expanded(
                        child: DatePicker(
                          datePickerLabel: AppStrings.contractEndDate.tr(
                            context,
                          ),
                          datePickerController: cubit.contractEndDateController,
                          datePickerHint: '0/0/0000',
                          validation: "هذا الحقل مطلوب",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ColumnedTextFormField(
                          title: AppStrings.idOrIqamaNumber.tr(context),
                          controller: cubit.idNumberController,
                          inputType: TextInputType.number,
                          hint:
                              '${AppStrings.enter.tr(context)} ${AppStrings.idOrIqamaNumber.tr(context)}',
                          validate: cubit.validate,
                        ),
                      ),
                      SizedBox(width: 20.0.w),
                      Expanded(
                        child: ColumnedTextFormField(
                          title: AppStrings.nationality.tr(context),
                          controller: cubit.nationalityController,
                          inputType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ColumnedTextFormField(
                          title: AppStrings.floorAndApartmentNumber.tr(context),
                          controller: cubit.floorApartmentNumberController,
                          inputType: TextInputType.number,
                          hint:
                              '${AppStrings.enter.tr(context)} ${AppStrings.rentedFloorAndApartmentNumber.tr(context)}',
                          validate: cubit.validate,
                        ),
                      ),
                      SizedBox(width: 20.0.w),
                      Expanded(
                        child: ColumnedTextFormField(
                          title: AppStrings.propertyOrBuildingName.tr(context),
                          controller:
                              cubit.buildingNumberController
                                ..text = cubit.selectedPropertyName.toString(),
                          inputType: TextInputType.number,
                          hint:
                              '${AppStrings.enter.tr(context)} ${AppStrings.propertyOrBuildingName.tr(context)}',
                          validate: cubit.validate,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0.h),
                ],
              ),
            ),
            SizedBox(width: 50.0.h),
            Column(
              children: [
                SizedBox(
                  width: 280.w,
                  height: 355.h,
                  child: ImagePicker(
                    title: AppStrings.addApartmentImage.tr(context),
                  ),
                ),
                Spacer(),
                TextButton.icon(
                  label: Text(
                    'التالي',
                    style: GoogleFonts.tajawal(
                      fontSize: 24.0.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary100,
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 24.0.sp,
                    color: AppColors.primary100,
                  ),
                  iconAlignment: IconAlignment.end,
                  onPressed: () async {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.changeCurrentIndex(1);
                    }
                  },
                ),
                SizedBox(height: 65.0.h),
              ],
            ),
          ],
        );
      },
    );
  }
}
