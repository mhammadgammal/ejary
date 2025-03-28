import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button_with_arrow_icon.dart';
import 'package:ejary/features/properties/presentation/all_properties/widgets/property_picture.dart';
import 'package:ejary/features/properties/presentation/all_properties/widgets/property_piece_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 250.w,
          height: 300.h,
          child: Card(
            color: AppColors.background50,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.gray100, width: 3.0.w),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.0.w,
                right: 10.0.w,
                top: 10.0.h,
                bottom: 10.0.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PropertyPicture(
                    imagePath:
                        "C:\\Users\\m7ame\\OneDrive\\Pictures\\WallPaper\\5IKmku.jpg",
                  ),
                  SizedBox(height: 10.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PropertyPieceInfoItem(
                        infoIconPath: AppIcons.buildingIc,
                        infoTitle: 'رقم 2',
                      ),
                      PropertyPieceInfoItem(
                        infoIconPath: AppIcons.streetSign,
                        infoTitle: 'حي المملكة',
                      ),
                      PropertyPieceInfoItem(
                        infoIconPath: AppIcons.homeModernIc,
                        infoTitle: '5 شقق',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0.h),
        CustomFilledButtonWithArrowIcon(
          width: 248.w,
          title: AppStrings.propertyDetails.tr(context),
          fillColor: AppColors.primary100,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          onPressed: () {},
        ),
      ],
    );
  }
}
