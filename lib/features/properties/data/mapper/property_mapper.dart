import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/base_item_layout/domain/base_property_entity.dart';
import 'package:ejary/core/widgets/base_item_layout/domain/base_property_piece_info_entity.dart';
import 'package:ejary/features/properties/data/model/property_model.dart';

abstract class PropertyMapper {
  static BasePropertyEntity mapPropertyModelToEntity(PropertyModel property) {
    return BasePropertyEntity(
      id: property.id,
      detailsButtonTitle: AppStrings.propertyDetails,
      imagePath: property.picturePath,
      propertyInfo: [
        BasePropertyPieceInfoEntity(
          infoIconPath: AppIcons.buildingIc,
          infoTitle: property.propertyName,
        ),
        BasePropertyPieceInfoEntity(
          infoIconPath: AppIcons.streetSign,
          infoTitle: property.districtName,
        ),
        BasePropertyPieceInfoEntity(
          infoIconPath: AppIcons.homeModernIc,
          infoTitle: ' شقق${property.numberOfApartments}',
        ),
      ],
    );
  }
}
