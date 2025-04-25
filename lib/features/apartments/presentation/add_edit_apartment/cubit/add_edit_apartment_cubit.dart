import 'dart:developer';

import 'package:ejary/core/di/di.dart';
import 'package:ejary/core/helpers/cache/database_helper/db_helper.dart';
import 'package:ejary/core/helpers/cache/database_helper/table_name.dart';
import 'package:ejary/features/apartments/data/model/apartment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

part 'add_edit_apartment_state.dart';

class AddEditApartmentCubit extends Cubit<AddEditApartmentState> {
  AddEditApartmentCubit() : super(AddEditApartmentInitial());

  static AddEditApartmentCubit get(context) => BlocProvider.of(context);

  late final bool isEditMode;
  late ApartmentModel _apartmentModel;
  late int selectedPropertyId;
  late String selectedPropertyName;
  late String selectedPropertyDistrict;

  final formKey = GlobalKey<FormState>();
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
  final TextEditingController nationalityController = TextEditingController();

  var currentIndex = 0;

  Future<void> addApartment(
    String apartmentImagePath,
    String contractImagePath,
  ) async {
    final apartment = ApartmentModel(
      id: -1,
      propertyId: selectedPropertyId,
      propertyName: selectedPropertyName,
      floorApartmentNumber: floorApartmentNumberController.text,
      picturePath: apartmentImagePath,
      contractPicturePath: contractImagePath,
      renterName: renterNameController.text,
      renterIdNumber: idNumberController.text,
      renterNationality: nationalityController.text,
      rentType: rentTypeController.text,
      totalRentValue: int.tryParse(totalRentValueController.text) ?? 0,
      paidRentValue: int.tryParse(paidValueController.text) ?? 0,
      remainingRentValue: int.tryParse(remainingValueController.text) ?? 0,
      contractStartDate: contractStartDateController.text,
      contractEndDate: contractEndDateController.text,
      renterPhoneNumber: phoneNumberController.text,
    );
    int apartmentId = await DbHelper.insertData(
      TableName.apartmentTable,
      apartment.toJson(),
    );
    if (apartmentId != -1) {
      sl<Database>().rawUpdate(
        'UPDATE ${TableName.propertyTable} SET number_of_apartments = number_of_apartments + 1 WHERE id = ?',
        [selectedPropertyId],
      );
    }
    emit(AddRentedApartmentSuccessState());
  }

  void loadApartmentData(ApartmentModel? apartmentModel) {
    if (apartmentModel != null) {
      renterNameController.text = apartmentModel.renterName;
      rentTypeController.text = apartmentModel.rentType;
      totalRentValueController.text = apartmentModel.totalRentValue.toString();
      paidValueController.text = apartmentModel.paidRentValue.toString();
      remainingValueController.text =
          apartmentModel.remainingRentValue.toString();
      contractStartDateController.text = apartmentModel.contractStartDate;
      contractEndDateController.text = apartmentModel.contractEndDate;
      phoneNumberController.text = apartmentModel.renterPhoneNumber;
      idNumberController.text = apartmentModel.renterIdNumber;
      buildingNumberController.text = apartmentModel.propertyName.toString();
      floorApartmentNumberController.text =
          apartmentModel.floorApartmentNumber.toString();
      nationalityController.text = apartmentModel.renterNationality;
      _apartmentModel = apartmentModel;
    }
  }

  Future<void> updateApartment(
    String apartmentImagePath,
    String contractImagePath,
  ) async {
    log(
      'AddEditApartmentCubit: updateApartment: apartmentImagePath => $apartmentImagePath',
    );
    log(
      'AddEditApartmentCubit: updateApartment: contractImagePath => $contractImagePath',
    );
    final apartment = ApartmentModel(
      id: _apartmentModel.id,
      propertyId: selectedPropertyId,
      propertyName: selectedPropertyName,
      floorApartmentNumber: floorApartmentNumberController.text,
      picturePath: apartmentImagePath,
      contractPicturePath: contractImagePath,
      renterName: renterNameController.text,
      renterIdNumber: idNumberController.text,
      renterNationality: nationalityController.text,
      rentType: rentTypeController.text,
      totalRentValue: int.tryParse(totalRentValueController.text) ?? 0,
      paidRentValue: int.tryParse(paidValueController.text) ?? 0,
      remainingRentValue: int.tryParse(remainingValueController.text) ?? 0,
      contractStartDate: contractStartDateController.text,
      contractEndDate: contractEndDateController.text,
      renterPhoneNumber: phoneNumberController.text,
      markAsRead: _apartmentModel.markAsRead,
    );
    await DbHelper.updateData(
      TableName.apartmentTable,
      apartment.toJson(),
      'id = ?',
      [_apartmentModel.id],
    );

    emit(UpdateRentedApartmentSuccessState());
  }

  Future<bool> isUpdate() async {
    try {
      var t = await DbHelper.getRecordById(
        _apartmentModel.id,
        tableName: TableName.apartmentTable,
      );
      return t.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteApartment() async {
    final success = await DbHelper.deleteData(TableName.apartmentTable, 'id', [
      _apartmentModel.id,
    ]);
    if (success) {
      sl<Database>().rawUpdate(
        'UPDATE ${TableName.propertyTable} SET number_of_apartments = number_of_apartments - 1 WHERE id = ?',
        [selectedPropertyId],
      );
      emit(DeleteSuccessState());
    }
  }

  void calcRemainingValue() {
    if (totalRentValueController.text.isNotEmpty &&
        paidValueController.text.isNotEmpty) {
      final totalRentValue = int.tryParse(totalRentValueController.text) ?? 0;
      final paidValue = int.tryParse(paidValueController.text) ?? 0;
      final remainingValue = totalRentValue - paidValue;
      remainingValueController.text = remainingValue.toString();
    } else {
      remainingValueController.clear();
    }
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

  void changeCurrentIndex(int i) {
    currentIndex = i;
    emit(ChangeCurrentIndexState());
  }
}
