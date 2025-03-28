import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/features/properties/presentation/all_properties/cubit/all_properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/property_item.dart';

class AllPropertiesScreen extends StatelessWidget {
  const AllPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllPropertiesCubit(),
      child: BlocBuilder<AllPropertiesCubit, AllPropertiesState>(
        builder: (context, state) {
          var cubit = AllPropertiesCubit.get(context);
          return Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _propertiesSummaryHeader(context, cubit.availableProperties),
              SizedBox(height: 20.0.h),
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: 10.0.w,
                  ),
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
                            index: index,
                          ),
                        ),
                    itemCount: 10,
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
