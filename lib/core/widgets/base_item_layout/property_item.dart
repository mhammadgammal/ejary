import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/widgets/base_item_layout/domain/base_property_entity.dart';
import 'package:ejary/core/widgets/base_item_layout/property_picture.dart';
import 'package:ejary/core/widgets/base_item_layout/property_piece_info_item.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button_with_arrow_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({
    super.key,
    this.propertyPressed,
    required this.property,
    required this.onPropertyPressed,
  });

  final void Function()? propertyPressed;
  final void Function(int) onPropertyPressed;
  final BasePropertyEntity property;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 250.w,
          height: 300.h,
          child: GestureDetector(
            onTap: () {
              propertyPressed?.call();
            },
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
                    PropertyPicture(imagePath: property.imagePath),
                    SizedBox(height: 40.0.h),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: property.propertyInfo.length,
                        itemBuilder:
                            (context, index) => PropertyPieceInfoItem(
                              infoIconPath:
                                  property.propertyInfo[index].infoIconPath,
                              infoTitle: property.propertyInfo[index].infoTitle,
                            ),
                        separatorBuilder:
                            (context, index) => SizedBox(width: 10.0.w),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0.h),
        CustomFilledButtonWithArrowIcon(
          width: 248.w,
          title: property.detailsButtonTitle.tr(context),
          fillColor: AppColors.primary100,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          onPressed: () => onPropertyPressed(property.id),
        ),
      ],
    );
  }
}
