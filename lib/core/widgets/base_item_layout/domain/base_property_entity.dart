import 'package:ejary/core/widgets/base_item_layout/domain/base_property_piece_info_entity.dart';

class BasePropertyEntity {
  final int id;
  final String imagePath;
  final String detailsButtonTitle;
  final List<BasePropertyPieceInfoEntity> propertyInfo;

  BasePropertyEntity({
    required this.id,
    required this.imagePath,
    required this.detailsButtonTitle,
    required this.propertyInfo,
  });
}
