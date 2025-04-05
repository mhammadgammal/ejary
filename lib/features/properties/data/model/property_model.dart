class PropertyModel {
  late int id;
  final int propertyNumber;
  final String districtName;
  final String picturePath;
  final int numberOfApartments;

  PropertyModel({
    required this.id,
    required this.propertyNumber,
    required this.districtName,
    required this.picturePath,
    required this.numberOfApartments,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
    id: json['id'] as int,
    propertyNumber: json['property_number'] as int,
    districtName: json['district_name'] as String,
    picturePath: json['picture_path'] as String,
    numberOfApartments: json['number_of_apartments'] as int,
  );

  Map<String, dynamic> toJson() => {
    'property_number': propertyNumber,
    'district_name': districtName,
    'picture_path': picturePath,
    'number_of_apartments': numberOfApartments,
  };
}
