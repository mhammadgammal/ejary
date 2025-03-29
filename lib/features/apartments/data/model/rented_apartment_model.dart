import 'package:ejary/features/apartments/data/model/apartment_model.dart';
import 'package:ejary/features/apartments/data/model/rent_model.dart';

class RentedApartmentModel {
  final ApartmentModel apartment;
  final RentModel rent;

  RentedApartmentModel({required this.apartment, required this.rent});

  Map<String, dynamic> toJson() => {
    'apartment': apartment.toJson(),
    'rent': rent.toJson(),
  };
}
