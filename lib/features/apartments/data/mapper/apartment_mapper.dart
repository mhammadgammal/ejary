import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/widgets/base_item_layout/domain/base_property_entity.dart';
import 'package:ejary/core/widgets/base_item_layout/domain/base_property_piece_info_entity.dart';
import 'package:ejary/features/apartments/data/model/apartment_model.dart';

abstract class ApartmentMapper {
  static BasePropertyEntity mapApartmentModelToEntity(
    ApartmentModel apartment,
  ) {
    return BasePropertyEntity(
      id: apartment.id,
      detailsButtonTitle: AppStrings.apartmentDetails,
      imagePath: apartment.picturePath,
      propertyInfo: [
        BasePropertyPieceInfoEntity(
          infoIconPath: AppIcons.homeModernIc,
          infoTitle: apartment.propertyName,
        ),
        BasePropertyPieceInfoEntity(
          infoIconPath: AppIcons.user,
          infoTitle: apartment.renterName,
        ),
        BasePropertyPieceInfoEntity(
          infoIconPath: AppIcons.payment,
          infoTitle: apartment.rentType,
        ),
      ],
    );
  }
}
