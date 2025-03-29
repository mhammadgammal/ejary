import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button_with_save_icon.dart';
import 'package:ejary/core/widgets/date_picker.dart';
import 'package:ejary/core/widgets/image_picker/image_picker.dart';
import 'package:ejary/core/widgets/text_form_field/columned_text_form_field.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/widgets/attach_file_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEditApartmentScreen extends StatelessWidget {
  const AddEditApartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
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
                AppStrings.addApartment.tr(context),
                style: GoogleFonts.tajawal(
                  fontSize: 40.0.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray200,
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
                                controller: TextEditingController(),
                                inputType: TextInputType.text,
                                hint:
                                    '${AppStrings.enter.tr(context)} ${AppStrings.renterName.tr(context)}',
                              ),
                            ),
                            SizedBox(width: 20.0.w),
                            Expanded(
                              child: ColumnedTextFormField(
                                title: AppStrings.phoneNumber.tr(context),
                                controller: TextEditingController(),
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
                                controller: TextEditingController(),
                                inputType: TextInputType.text,
                                hint: 'Annual or Monthly ?'.tr(context),
                              ),
                            ),
                            SizedBox(width: 20.0.w),
                            Expanded(
                              child: ColumnedTextFormField(
                                title: AppStrings.allRentValue.tr(context),
                                controller: TextEditingController(),
                                inputType: TextInputType.number,
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
                                controller: TextEditingController(),
                                inputType: TextInputType.text,
                                hint: 'Write paid value from renter'.tr(
                                  context,
                                ),
                              ),
                            ),
                            SizedBox(width: 20.0.w),
                            Expanded(
                              child: ColumnedTextFormField(
                                title: AppStrings.remaining.tr(context),
                                controller: TextEditingController(),
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
                                datePickerLabel: AppStrings.contractStartDate
                                    .tr(context),
                                datePickerController: TextEditingController(),
                                datePickerHint: '0/0/0000',
                                validation: null,
                              ),
                            ),
                            SizedBox(width: 20.0.w),
                            Expanded(
                              child: DatePicker(
                                datePickerLabel: AppStrings.contractEndDate.tr(
                                  context,
                                ),
                                datePickerController: TextEditingController(),
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
                                title: AppStrings.idOrIqamaNumber.tr(context),
                                controller: TextEditingController(),
                                inputType: TextInputType.number,
                                hint:
                                    '${AppStrings.enter.tr(context)} ${AppStrings.idOrIqamaNumber.tr(context)}',
                              ),
                            ),
                            SizedBox(width: 20.0.w),
                            Expanded(
                              child: ColumnedTextFormField(
                                title: AppStrings.propertyOrBuildingNumber.tr(
                                  context,
                                ),
                                controller: TextEditingController(),
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
                                title: AppStrings.floorAndApartmentNumber.tr(
                                  context,
                                ),
                                controller: TextEditingController(),
                                inputType: TextInputType.number,
                                hint:
                                    '${AppStrings.enter.tr(context)} ${AppStrings.idOrIqamaNumber.tr(context)}',
                              ),
                            ),
                            SizedBox(width: 20.0.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.uploadPicture.tr(context),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 20.sp),
                                  ),
                                  SizedBox(height: 10.0.h),
                                  AttachFileButton(
                                    title: AppStrings.uploadContract,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    pickCallback: () {},
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
                        onPressed: () {},
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
  }
}
