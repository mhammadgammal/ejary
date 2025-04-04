import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/buttons/custom_outlined_button_with_border.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button_with_save_icon.dart';
import 'package:ejary/core/widgets/date_picker.dart';
import 'package:ejary/core/widgets/dialog_helper/dialog_helper.dart';
import 'package:ejary/core/widgets/image_picker/cubit/image_picker_cubit.dart';
import 'package:ejary/core/widgets/image_picker/image_picker.dart';
import 'package:ejary/core/widgets/text_form_field/columned_text_form_field.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/cubit/add_edit_apartment_cubit.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/widgets/attach_file_button.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/widgets/cubit/attach_file_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEditApartmentScreen extends StatelessWidget {
  const AddEditApartmentScreen({super.key});

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
        return Container(
          padding: EdgeInsetsDirectional.only(
            top: 50.0.h,
            start: 45.0.w,
            end: 70.0.w,
            bottom: 45.0.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(
                      AppIcons.greenArrowRight,
                      width: 48.0.w,
                      height: 48.0.h,
                    ),
                  ),
                  Text(
                    (AddEditApartmentCubit.get(context).isEditMode
                            ? AppStrings.apartmentDetails
                            : AppStrings.addApartment)
                        .tr(context),
                    style: GoogleFonts.tajawal(
                      fontSize: 40.0.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.gray200,
                    ),
                  ),
                  Spacer(),
                  Visibility(
                    visible: AddEditApartmentCubit.get(context).isEditMode,
                    child: CustomOutlinedButtonWithBorder(
                      width: 150.0.w,
                      onPressed: () {
                        DialogHelper.deleteDialog(
                          context,
                          () {
                            AddEditApartmentCubit.get(
                              context,
                            ).deleteApartment();
                          },
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                      title: 'Delete apartment'.tr(context),
                      titleColor: AppColors.failure,
                      borderColor: AppColors.failure,
                      icon: SvgPicture.asset(AppIcons.deleteIc),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0.h),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.gray100, width: 1.0.w),
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  padding: EdgeInsetsDirectional.only(start: 20.0.w),
                  child: Row(
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
                                  ),
                                ),
                                SizedBox(width: 20.0.w),
                                Expanded(
                                  child: ColumnedTextFormField(
                                    title: AppStrings.phoneNumber.tr(context),
                                    controller: cubit.phoneNumberController,
                                    inputType: TextInputType.number,
                                    icon: Padding(
                                      padding: EdgeInsets.only(
                                        top: 8.0.h,
                                        right: 10.0.w,
                                      ),
                                      child: Text(
                                        '+996 |',
                                        style: GoogleFonts.tajawal(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0.sp,
                                          color: AppColors.gray100,
                                        ),
                                      ),
                                    ),
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
                                  ),
                                ),
                                SizedBox(width: 20.0.w),
                                Expanded(
                                  child: ColumnedTextFormField(
                                    title: AppStrings.allRentValue.tr(context),
                                    controller: cubit.totalRentValueController,
                                    inputType: TextInputType.number,
                                    onChanged:
                                        (_) => cubit.calcRemainingValue(),
                                    hint:
                                        '${AppStrings.enter.tr(context)} ${AppStrings.allRentValue.tr(context)}',
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
                                    onChanged:
                                        (_) => cubit.calcRemainingValue(),
                                    hint: 'Write paid value from renter'.tr(
                                      context,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.0.w),
                                Expanded(
                                  child: ColumnedTextFormField(
                                    title: AppStrings.remaining.tr(context),
                                    controller: cubit.remainingValueController,
                                    inputType: TextInputType.number,
                                    hint:
                                        'Here value of remaining rent automatically'
                                            .tr(context),
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
                                    datePickerLabel: AppStrings
                                        .contractStartDate
                                        .tr(context),
                                    datePickerController:
                                        cubit.contractStartDateController,
                                    datePickerHint: '0/0/0000',
                                    validation: null,
                                  ),
                                ),
                                SizedBox(width: 20.0.w),
                                Expanded(
                                  child: DatePicker(
                                    datePickerLabel: AppStrings.contractEndDate
                                        .tr(context),
                                    datePickerController:
                                        cubit.contractEndDateController,
                                    datePickerHint: '0/0/0000',
                                    validation: null,
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
                                    title: AppStrings.idOrIqamaNumber.tr(
                                      context,
                                    ),
                                    controller: cubit.idNumberController,
                                    inputType: TextInputType.number,
                                    hint:
                                        '${AppStrings.enter.tr(context)} ${AppStrings.idOrIqamaNumber.tr(context)}',
                                  ),
                                ),
                                SizedBox(width: 20.0.w),
                                Expanded(
                                  child: ColumnedTextFormField(
                                    title: AppStrings.propertyOrBuildingNumber
                                        .tr(context),
                                    controller: cubit.buildingNumberController,
                                    inputType: TextInputType.number,
                                    hint:
                                        '${AppStrings.enter.tr(context)} ${AppStrings.propertyOrBuildingNumber.tr(context)}',
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
                                    title: AppStrings.floorAndApartmentNumber
                                        .tr(context),
                                    controller:
                                        cubit.floorApartmentNumberController,
                                    inputType: TextInputType.number,
                                    hint:
                                        '${AppStrings.enter.tr(context)} ${AppStrings.idOrIqamaNumber.tr(context)}',
                                  ),
                                ),
                                SizedBox(width: 20.0.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.uploadPicture.tr(context),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(fontSize: 20.sp),
                                      ),
                                      SizedBox(height: 10.0.h),
                                      BlocBuilder<
                                        AddEditApartmentCubit,
                                        AddEditApartmentState
                                      >(
                                        builder: (context, state) {
                                          return AttachFileButton(
                                            title: AppStrings.uploadContract,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0.h),
                          ],
                        ),
                      ),
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
                          CustomFilledButtonWithSaveIcon(
                            width: 343.w,
                            height: 56.h,
                            title: AppStrings.saveData.tr(context),
                            onPressed: () async {
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
                            },
                            fontSize: 18.sp,
                            padding: EdgeInsetsDirectional.only(end: 20.0.h),
                          ),
                          SizedBox(height: 65.0.h),
                        ],
                      ),
                    ],
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
