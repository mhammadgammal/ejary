import 'package:ejary/core/helpers/cache/database_helper/db_helper.dart';
import 'package:ejary/core/helpers/cache/database_helper/table_name.dart';
import 'package:ejary/features/apartments/data/model/apartment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_edit_apartment_state.dart';

class AddEditApartmentCubit extends Cubit<AddEditApartmentState> {
  AddEditApartmentCubit() : super(AddEditApartmentInitial());

  static AddEditApartmentCubit get(context) => BlocProvider.of(context);

  late final bool isEditMode;
  late ApartmentModel apartmentModel;
  late int selectedPropertyId;
  late int selectedPropertyNumber;
  late String selectedPropertyDistrict;

  final TextEditingController renterNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController rentTypeController = TextEditingController();
  final TextEditingController totalRentValueController =
      TextEditingController();
  final TextEditingController paidValueController = TextEditingController();
  final TextEditingController remainingValueController =
      TextEditingController();
  final TextEditingController contractStartDateController =
      TextEditingController();
  final TextEditingController contractEndDateController =
      TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController buildingNumberController =
      TextEditingController();
  final TextEditingController floorApartmentNumberController =
      TextEditingController();

  Future<void> addApartment(
    String apartmentImagePath,
    String contractImagePath,
  ) async {
    final apartment = ApartmentModel(
      id: -1,
      propertyId: selectedPropertyId,
      propertyNumber: selectedPropertyNumber,
      floorApartmentNumber:
          int.tryParse(floorApartmentNumberController.text) ?? 0,
      picturePath: apartmentImagePath,
      contractPicturePath: contractImagePath,
      renterName: renterNameController.text,
      renterIdNumber: idNumberController.text,
      rentType: rentTypeController.text,
      totalRentValue: int.tryParse(totalRentValueController.text) ?? 0,
      paidRentValue: int.tryParse(paidValueController.text) ?? 0,
      remainingRentValue: int.tryParse(remainingValueController.text) ?? 0,
      contractStartDate: contractStartDateController.text,
      contractEndDate: contractEndDateController.text,
      renterPhoneNumber: phoneNumberController.text,
    );
    await DbHelper.insertData(TableName.apartmentTable, apartment.toJson());

    emit(AddRentedApartmentSuccessState());
  }

  void loadApartmentData() {
    // renterNameController.text = rentedApartmentModel.rent.renterName;
    // rentTypeController.text = rentedApartmentModel.rent.rentType;
    // totalRentValueController.text =
    //     rentedApartmentModel.rent.totalRentValue.toString();
    // paidValueController.text =
    //     rentedApartmentModel.rent.paidRentValue.toString();
    // remainingValueController.text =
    //     rentedApartmentModel.rent.remainingRentValue.toString();
    // contractStartDateController.text =
    //     rentedApartmentModel.rent.contractStartDate;
    // contractEndDateController.text = rentedApartmentModel.rent.contractEndDate;
    // phoneNumberController.text = rentedApartmentModel.rent.renterPhoneNumber;
    // idNumberController.text = rentedApartmentModel.rent.renterIdNumber;
    // buildingNumberController.text =
    //     rentedApartmentModel.apartment.propertyNumber.toString();
    // floorApartmentNumberController.text =
    //     rentedApartmentModel.apartment.floorApartmentNumber.toString();
  }
}
