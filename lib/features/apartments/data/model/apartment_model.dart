class ApartmentModel {
  final int id;
  final int propertyId;
  final String propertyName;
  final String floorApartmentNumber;
  final String picturePath;
  final String renterName;
  final String renterIdNumber;
  final String renterPhoneNumber;
  final String renterNationality;
  final String rentType;
  final int totalRentValue;
  final int paidRentValue;
  final int remainingRentValue;
  final String contractStartDate;
  final String contractEndDate;
  final String contractPicturePath;
  final int numberOfPayments;
  final int markAsRead;

  ApartmentModel({
    required this.id,
    required this.propertyId,
    required this.propertyName,
    required this.floorApartmentNumber,
    required this.picturePath,
    required this.renterName,
    required this.renterPhoneNumber,
    required this.renterNationality,
    required this.rentType,
    required this.totalRentValue,
    required this.paidRentValue,
    required this.remainingRentValue,
    required this.contractStartDate,
    required this.contractEndDate,
    required this.contractPicturePath,
    required this.renterIdNumber,
    required this.numberOfPayments,
    this.markAsRead = 0,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
    id: json['id'] ?? -1,
    propertyId: json['property_id'] ?? -1,
    propertyName: json['property_name'] ?? -1,
    floorApartmentNumber: json['floor_apartment_number'].toString(),
    picturePath: json['picture_path'] ?? '',
    renterName: json['renter_name'] ?? '',
    renterPhoneNumber: json['renter_phone_number'] ?? '',
    renterNationality: json['nationality'] ?? '',
    rentType: json['rent_type'] ?? '',
    totalRentValue: json['total_rent_value'] ?? -1,
    paidRentValue: json['paid_rent_value'] ?? -1,
    remainingRentValue: json['remaining_rent_value'] ?? -1,
    contractStartDate: json['contract_start_date'] ?? '',
    contractEndDate: json['contract_end_date'] ?? '',
    contractPicturePath: json['contract_picture_path'] ?? '',
    renterIdNumber: json['renter_id_number'] ?? '',
    numberOfPayments: json['number_of_payment'] ?? 1,
    markAsRead: json['mark_as_read'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'property_id': propertyId,
    'property_name': propertyName,
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
    'contract_picture_path': contractPicturePath,
    'renter_id_number': renterIdNumber,
    'mark_as_read': markAsRead,
    'nationality': renterNationality,
    'number_of_payment': numberOfPayments,
  };
}
