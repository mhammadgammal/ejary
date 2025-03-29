class RentModel {
  final int id;
  final int apartmentId;
  final String renterName;
  final String renterPhoneNumber;
  final String rentType;
  final int totalRentValue;
  final int paidRentValue;
  final int remainingRentValue;
  final String contractStartDate;
  final String contractEndDate;
  final String picturePath;

  RentModel({
    required this.id,
    required this.apartmentId,
    required this.renterName,
    required this.renterPhoneNumber,
    required this.rentType,
    required this.totalRentValue,
    required this.paidRentValue,
    required this.remainingRentValue,
    required this.contractStartDate,
    required this.contractEndDate,
    required this.picturePath,
  });

  factory RentModel.fromJson(Map<String, dynamic> json) => RentModel(
    id: json['id'] as int,
    apartmentId: json['apartment_id'] as int,
    renterName: json['renter_name'] as String,
    renterPhoneNumber: json['renter_phone_number'] as String,
    rentType: json['rent_type'] as String,
    totalRentValue: json['total_rent_value'] as int,
    paidRentValue: json['paid_rent_value'] as int,
    remainingRentValue: json['remaining_rent_value'] as int,
    contractStartDate: json['contract_start_date'] as String,
    contractEndDate: json['contract_end_date'] as String,
    picturePath: json['picture_path'] as String,
  );

  Map<String, dynamic> toJson() => {
    'apartment_id': apartmentId,
    'renter_name': renterName,
    'renter_phone_number': renterPhoneNumber,
    'rent_type': rentType,
    'total_rent_value': totalRentValue,
    'paid_rent_value': paidRentValue,
    'remaining_rent_value': remainingRentValue,
    'contract_start_date': contractStartDate,
    'contract_end_date': contractEndDate,
    'picture_path': picturePath,
  };
}
