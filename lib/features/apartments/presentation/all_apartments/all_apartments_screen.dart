import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/router/app_navigator.dart';
import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/base_empty_state.dart';
import 'package:ejary/core/widgets/base_item_layout/property_item.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button.dart';
import 'package:ejary/features/apartments/data/mapper/apartment_mapper.dart';
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
              cubit.selectedPropertyId,
              cubit.selectedPropertyName,
              cubit.selectedPropertyDistrict,
              cubit.totalApartments,
              state is GetAllApartmentsSuccessState &&
                  (cubit.apartments != null && cubit.apartments!.isEmpty),
              cubit.getAllApartments,
            ),
            SizedBox(height: 20.0.h),
            state is GetAllApartmentsLoadingState
                ? CircularProgressIndicator()
                : state is GetAllApartmentsSuccessState &&
                    (cubit.apartments != null && cubit.apartments!.isEmpty)
                ? BaseEmptyState(
                  thumbnailIconPath: AppIcons.homeModernIc,
                  title: 'No Apartments currently..add it from here',
                  buttonText: AppStrings.addApartment,
                  onPressed: () {
                    AppNavigator.navigateTo(
                      context,
                      RouteKeys.addEditApartment,
                      arguments: {
                        'property_id': cubit.selectedPropertyId,
                        'property_name': cubit.selectedPropertyName,
                        'property_district': cubit.selectedPropertyDistrict,
                      },
                    ).then((_) => cubit.getAllApartments());
                  },
                )
                : state is GetAllApartmentsErrorState
                ? Text('Failed')
                : Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(end: 10.0.w),
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
                              property:
                                  ApartmentMapper.mapApartmentModelToEntity(
                                    cubit.apartments![index],
                                  ),
                              onPropertyPressed: (_) {
                                AppNavigator.navigateTo(
                                  context,
                                  RouteKeys.addEditApartment,
                                  arguments: {
                                    'property_id': cubit.selectedPropertyId,
                                    'property_name': cubit.selectedPropertyName,
                                    'property_district':
                                        cubit.selectedPropertyDistrict,
                                    'apartment': cubit.apartments![index],
                                  },
                                ).then((_) => cubit.getAllApartments());
                              },
                            ),
                          ),
                      itemCount:
                          cubit.apartments == null
                              ? 0
                              : cubit.apartments!.length,
                    ),
                  ),
                ),
          ],
        );
      },
    );
  }

  Widget _allApartmentsHeader(
    BuildContext context,
    int propertyId,
    String propertyName,
    String propertyDistrict,
    int totalApartments,
    bool isEmpty,
    void Function() afterNav,
  ) => Padding(
    padding: EdgeInsetsDirectional.only(start: 45.0.w, end: 70.0.w),
    child: Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            AppIcons.greenArrowRight,
            width: 48.0.w,
            height: 48.0.h,
          ),
        ),
        SizedBox(width: 10.0.w),
        RichText(
          text: TextSpan(
            text: 'عقار $propertyName $propertyDistrict\t',
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
        Visibility(
          visible: !isEmpty,
          child: CustomFilledButton(
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
              AppNavigator.navigateTo(
                context,
                RouteKeys.addEditApartment,
                arguments: {
                  'property_id': propertyId,
                  'property_name': propertyName,
                  'property_district': propertyDistrict,
                },
              ).then((_) => afterNav());
            },
          ),
        ),
      ],
    ),
  );
}
