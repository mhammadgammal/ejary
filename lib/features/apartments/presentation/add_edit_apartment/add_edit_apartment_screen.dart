import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/buttons/custom_outlined_button_with_border.dart';
import 'package:ejary/core/widgets/dialog_helper/dialog_helper.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/cubit/add_edit_apartment_cubit.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/screens/apartment_details_screen.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/screens/contract_screen.dart';
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
                SizedBox(height: 40.0.h),
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
                    child: IndexedStack(
                      index: cubit.currentIndex,
                      children: [ApartmentDetailsScreen(), ContractScreen()],
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
}
