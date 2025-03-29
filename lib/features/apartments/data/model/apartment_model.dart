class ApartmentModel {
  final int id;
  final int propertyId;
  final int propertyNumber;
  final int floorApartmentNumber;
  final String picturePath;
  final String renterName;
  final String renterIdNumber;
  final String renterPhoneNumber;
  final String rentType;
  final int totalRentValue;
  final int paidRentValue;
  final int remainingRentValue;
  final String contractStartDate;
  final String contractEndDate;
  final String contractPicturePath;
  ApartmentModel({
    required this.id,
    required this.propertyId,
    required this.propertyNumber,
    required this.floorApartmentNumber,
    required this.picturePath,
    required this.renterName,
    required this.renterPhoneNumber,
    required this.rentType,
    required this.totalRentValue,
    required this.paidRentValue,
    required this.remainingRentValue,
    required this.contractStartDate,
    required this.contractEndDate,
    required this.contractPicturePath,
    required this.renterIdNumber,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
    id: json['id'] as int,
    propertyId: json['property_id'] as int,
    propertyNumber: json['property_number'] as int,
    floorApartmentNumber: json['floor_apartment_number'] as int,
    picturePath: json['apartment_picture_path'] as String,
    renterName: json['renter_name'] as String,
    renterPhoneNumber: json['renter_phone_number'] as String,
    rentType: json['rent_type'] as String,
    totalRentValue: json['total_rent_value'] as int,
    paidRentValue: json['paid_rent_value'] as int,
    remainingRentValue: json['remaining_rent_value'] as int,
    contractStartDate: json['contract_start_date'] as String,
    contractEndDate: json['contract_end_date'] as String,
    contractPicturePath: json['contract_picture_path'] as String,
    renterIdNumber: json['renter_id_number'] as String,
  );

  Map<String, dynamic> toJson() => {
    'property_id': propertyId,
    'property_number': propertyNumber,
    'floor_apartment_number': floorApartmentNumber,
    'picture_path': picturePath,
    'renter_name': renterName,
    'renter_phone_number': renterPhoneNumber,
    'rent_type': rentType,
    'total_rent_value': totalRentValue,
    'paid_rent_value': paidRentValue,
    'remaining_rent_value': remainingRentValue,
    'contract_start_date': contractStartDate,
    'contract_end_date': contractEndDate,
    'contract_picture_path': picturePath,
    'renter_id_number': renterIdNumber,
  };
}
