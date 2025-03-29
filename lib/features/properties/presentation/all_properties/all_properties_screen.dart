import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/router/app_navigator.dart';
import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/base_item_layout/domain/base_property_entity.dart';
import 'package:ejary/core/widgets/base_item_layout/domain/base_property_piece_info_entity.dart';
import 'package:ejary/features/properties/presentation/all_properties/cubit/all_properties_cubit.dart';
import 'package:ejary/features/properties/presentation/all_properties/widgets/empty_properties_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/widgets/base_item_layout/property_item.dart';

class AllPropertiesScreen extends StatelessWidget {
  const AllPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllPropertiesCubit()..getAllProperties(),
      child: BlocBuilder<AllPropertiesCubit, AllPropertiesState>(
        builder: (context, state) {
          var cubit = AllPropertiesCubit.get(context);
          return Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _propertiesSummaryHeader(context, cubit.availableProperties),
              SizedBox(height: 20.0.h),
              state is GetAllPropertiesLoadingState
                  ? CircularProgressIndicator()
                  : state is GetAllPropertiesSuccessState &&
                      cubit.properties != null &&
                      cubit.properties!.isEmpty
                  ? Expanded(child: EmptyPropertiesState())
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
                                property: BasePropertyEntity(
                                  id: 1,
                                  imagePath:
                                      "C:\\Users\\m7ame\\OneDrive\\Pictures\\WallPaper\\5IKmku.jpg",
                                  detailsButtonTitle:
                                      AppStrings.propertyDetails,
                                  propertyInfo: [
                                    BasePropertyPieceInfoEntity(
                                      infoIconPath: AppIcons.buildingIc,
                                      infoTitle: 'رقم 12',
                                    ),
                                    BasePropertyPieceInfoEntity(
                                      infoIconPath: AppIcons.streetSign,
                                      infoTitle: "حي المملكة",
                                    ),
                                    BasePropertyPieceInfoEntity(
                                      infoIconPath: AppIcons.homeModernIc,
                                      infoTitle: '5 شقق',
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
                        itemCount:
                            cubit.properties == null
                                ? 0
                                : cubit.properties!.length,
                      ),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }

  Widget _propertiesSummaryHeader(
    BuildContext context,
    int availableProperties,
  ) => Padding(
    padding: EdgeInsetsDirectional.only(start: 45.0.w, end: 70.0.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.allProperties.tr(context),
          style: GoogleFonts.tajawal(
            color: AppColors.black,
            fontSize: 40.0.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '${AppStrings.availableProperties.tr(context)}: $availableProperties',
          style: GoogleFonts.tajawal(fontSize: 20.sp, color: AppColors.gray100),
        ),
      ],
    ),
  );
}
