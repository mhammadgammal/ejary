class ApartmentModel {
  final int id;
  final int propertyId;
  final int propertyNumber;
  final int floorApartmentNumber;
  final String picturePath;

  ApartmentModel({
    required this.id,
    required this.propertyId,
    required this.propertyNumber,
    required this.floorApartmentNumber,
    required this.picturePath,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
    id: json['id'] as int,
    propertyId: json['property_id'] as int,
    propertyNumber: json['property_number'] as int,
    floorApartmentNumber: json['floor_apartment_number'] as int,
    picturePath: json['picture_path'] as String,
  );

  Map<String, dynamic> toJson() => {
    'property_id': propertyId,
    'property_number': propertyNumber,
    'floor_apartment_number': floorApartmentNumber,
    'picture_path': picturePath,
  };
}
