import 'package:ejary/core/app_container/cubit/app_cubit.dart';
import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/app_bar/widgets/app_bar_item.dart';
import 'package:ejary/core/widgets/text_form_field/app_text_form_field.dart';
import 'package:ejary/features/apartments/presentation/all_apartments/cubit/all_apartments_cubit.dart';
import 'package:ejary/features/properties/presentation/all_properties/cubit/all_properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EjaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EjaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var allProCubit = AllPropertiesCubit.get(context);
        var allApartmentCubit = AllApartmentsCubit.get(context);
        return Container(
          height: 95.0.h,
          color: AppColors.primary100,
          padding: EdgeInsetsDirectional.only(start: 30.0.w, end: 50.0.w),
          child: Row(
            children: [
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => AppBarItem(
                        title: cubit.appBarActions[index].$1.tr(context),
                        //AppIcons.homeIc
                        iconPath: cubit.appBarActions[index].$2,
                        selectedIconPath: cubit.appBarActions[index].$3,
                        isSelected: cubit.selectedIndex == index,
                        onPressed: () => cubit.changeTabIndex(index),
                      ),
                  separatorBuilder: (context, index) => SizedBox(width: 30.0.w),
                  itemCount: cubit.appBarActions.length,
                ),
              ),
              Container(
                width: 530.w,
                // height: 80.h,
                margin: EdgeInsetsDirectional.only(start: 150.0.w),
                child: AppTextFormField(
                  hintLabel: AppStrings.searchHint.tr(context),
                  hintColor: AppColors.gray100,
                  icon: Container(
                    padding:EdgeInsets.symmetric(vertical:  8.0.h),
                    child: SvgPicture.asset(
                      AppIcons.searchIc,
                      colorFilter: ColorFilter.mode(
                        AppColors.gray100,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  controller: cubit.searchController,
                  inputType: TextInputType.text,
                  onChanged: (value) async {
                    cubit.changeTabIndex(0);
                    await allProCubit.filterProperties(value);
                    await allApartmentCubit.filterApartments(value);
                  },
                  onSubmit: (_) {},
                  fillColor: AppColors.background50,
                  suffixIcon: IconButton(
                    onPressed: () {
                      cubit.searchController.clear();
                      allProCubit.resetFilter();
                      allApartmentCubit.resetFilter();
                    },
                    icon: SvgPicture.asset(
                      AppIcons.xIc,
                      colorFilter: ColorFilter.mode(
                        AppColors.gray100,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  validate: null,
                ),
              ),
              AppBarItem(
                onPressed: () {
                  cubit.changeTabIndex(3);
                },
                title: '',
                iconPath: AppIcons.settingsIc,
                selectedIconPath: AppIcons.settingsFilledIc,
                isSelected: cubit.selectedIndex == 3,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(95.0.h);
}
