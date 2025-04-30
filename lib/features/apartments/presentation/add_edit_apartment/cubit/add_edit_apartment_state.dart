part of 'add_edit_apartment_cubit.dart';

sealed class AddEditApartmentState {}

final class AddEditApartmentInitial extends AddEditApartmentState {}

final class AddRentedApartmentSuccessState extends AddEditApartmentState {}

final class UpdateRentedApartmentSuccessState extends AddEditApartmentState {}

final class DeleteSuccessState extends AddEditApartmentState {}

final class ChangeCurrentIndexState extends AddEditApartmentState {}

final class ChangePaymentTypeState extends AddEditApartmentState {}

final class NextPaymentSelectedState extends AddEditApartmentState {}
