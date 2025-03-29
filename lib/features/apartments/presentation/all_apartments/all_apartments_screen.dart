import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/router/app_navigator.dart';
import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/base_item_layout/domain/base_property_entity.dart';
import 'package:ejary/core/widgets/base_item_layout/domain/base_property_piece_info_entity.dart';
import 'package:ejary/core/widgets/base_item_layout/property_item.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/all_apartments_cubit.dart';

class AllApartmentsScreen extends StatelessWidget {
  const AllApartmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllApartmentsCubit, AllApartmentsState>(
      builder: (context, state) {
        var cubit = AllApartmentsCubit.get(context);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _allApartmentsHeader(
              context,
              cubit.selectedPropertyNumber,
              cubit.selectedPropertyDistrict,
              cubit.totalApartments,
            ),
            SizedBox(height: 20.0.h),
            Flexible(
              fit: FlexFit.loose,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.9,
                ),
                addRepaintBoundaries: true,
                padding: EdgeInsets.zero,
                itemBuilder:
                    (context, index) => SizedBox(
                      width: 250.w,
                      height: 350.h,
                      child: PropertyItem(
                        property: BasePropertyEntity(
                          id: 1,
                          imagePath:
                              "C:\\Users\\m7ame\\OneDrive\\Pictures\\WallPaper\\5IKmku.jpg",
                          detailsButtonTitle: AppStrings.apartmentDetails,
                          propertyInfo: [
                            BasePropertyPieceInfoEntity(
                              infoIconPath: AppIcons.homeModernIc,
                              infoTitle: 'رقم 15',
                            ),
                            BasePropertyPieceInfoEntity(
                              infoIconPath: AppIcons.user,
                              infoTitle: "أحمد السيد",
                            ),
                            BasePropertyPieceInfoEntity(
                              infoIconPath: AppIcons.payment,
                              infoTitle: "شهرياً",
                            ),
                          ],
                        ),
                        onPropertyPressed: (propertyId) {
                          AppNavigator.navigateTo(
                            context,
                            RouteKeys.allApartments,
                            arguments: {'property_id': propertyId},
                          );
                        },
                      ),
                    ),
                itemCount: 10,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _allApartmentsHeader(
    BuildContext context,
    int propertyNumber,
    String propertyDistrict,
    int totalApartments,
  ) => Padding(
    padding: EdgeInsetsDirectional.only(start: 45.0.w, end: 70.0.w),
    child: Row(
      children: [
        SvgPicture.asset(
          AppIcons.greenArrowRight,
          width: 48.0.w,
          height: 48.0.h,
        ),
        SizedBox(width: 10.0.w),
        RichText(
          text: TextSpan(
            text:
                '${AppStrings.propertyNumber.tr(context)}$propertyNumber / $propertyDistrict\t',
            style: GoogleFonts.tajawal(
              fontSize: 40.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
            children: [
              TextSpan(
                text:
                    '${'Number of apartments inside building'.tr(context)} : $totalApartments',
                style: GoogleFonts.tajawal(
                  fontSize: 22.8.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray100,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        CustomFilledButton(
          width: 248.w,
          height: 48.h,
          title: AppStrings.addNewApartment.tr(context),
          fillColor: AppColors.secondary,
          icon: SvgPicture.asset(
            AppIcons.plus,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
          iconAlignment: IconAlignment.start,
          onPressed: () {
            AppNavigator.navigateTo(context, RouteKeys.addEditApartment);
          },
        ),
      ],
    ),
  );
}
