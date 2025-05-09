import 'dart:developer';

import 'package:ejary/core/di/di.dart';
import 'package:ejary/core/helpers/cache/database_helper/db_helper.dart';
import 'package:ejary/core/helpers/cache/database_helper/table_name.dart';
import 'package:ejary/features/apartments/data/model/apartment_model.dart';
import 'package:ejary/features/apartments/data/model/payment_model.dart';
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

  List<String> paymentsList = [
    "one payment",
    "two payments",
    "three payments",
    "four payments",
    "five payments",
    "six payments",
  ];

  int? selectedPaymentType;

  String nextPaymentDate = '';

  late List<Map<String, dynamic>> batches;

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
      numberOfPayments: selectedPaymentType!,
    );
    int apartmentId = await DbHelper.insertData(
      TableName.apartmentTable,
      apartment.toJson(),
    );
    if (apartmentId != -1) {
      _incrementPropertyApartmentsCount(selectedPropertyId);

      _insertBatches(apartmentId);
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
      selectedPaymentType = apartmentModel.numberOfPayments;
      onPaymentTypeChanged(selectedPaymentType);
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
      numberOfPayments: selectedPaymentType!,
    );
    final isUpdated = await DbHelper.updateData(
      TableName.apartmentTable,
      apartment.toJson(),
      'id = ?',
      [_apartmentModel.id],
    );
    if (isUpdated &&
        (selectedPaymentType != null &&
                selectedPaymentType != _apartmentModel.numberOfPayments ||
            contractStartDateController.text !=
                _apartmentModel.contractStartDate ||
            contractEndDateController.text !=
                _apartmentModel.contractEndDate)) {
      log('AddEditApartmentCubit: start updating payment batches');
      _updatePaymentBatches(_apartmentModel.id, selectedPaymentType!);
    }
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
    log(
      'AddEditApartmentCubit: deleteApartment: _apartmentModel => ${_apartmentModel.id}',
    );
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
        selectedPaymentType != null) {
      final totalRentValue = int.tryParse(totalRentValueController.text) ?? 0;
      final remainingValue = totalRentValue ~/ selectedPaymentType!;
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

  void onPaymentTypeChanged(int? x) {
    selectedPaymentType = x;
    if (x != null) {
      remainingValueController.text =
          (int.parse(totalRentValueController.text) ~/ x).toString();
    }

    if (contractStartDateController.text.isNotEmpty &&
        contractEndDateController.text.isNotEmpty) {
      final startDate = DateTime.parse(contractStartDateController.text);
      final endDate = DateTime.parse(contractEndDateController.text);
      final batches = _dividePeriodAcrossBatches(
        startDate,
        endDate,
        selectedPaymentType!,
      );
      nextPaymentDate =
          batches
              .firstWhere(
                (e) => !e['end'].isAfter(DateTime.now()),
                orElse: () => batches.first,
              )['end']
              .toIso8601String()
              .split('T')
              .first
              .toString();
      // batches[0]['end']!.toIso8601String().split('T').first.toString();
      log(
        'AddEditApartmentCubit: onPaymentTypeChanged: nextPaymentDate => $nextPaymentDate',
      );
    }
    emit(ChangePaymentTypeState());
  }

  List<Map<String, dynamic>> _dividePeriodAcrossBatches(
    DateTime startDate,
    DateTime endDate,
    int numberOfBatches,
  ) {
    final totalDuration = endDate.difference(startDate);
    final durationPerBatch = Duration(
      microseconds: totalDuration.inMicroseconds ~/ numberOfBatches,
    );

    List<Map<String, dynamic>> batches = [];
    final batchAmount =
        int.parse(totalRentValueController.text) ~/ numberOfBatches;
    log(
      'AddEditApartmentCubit: _dividePeriodAcrossBatches: batchAmount => $batchAmount',
    );
    for (int i = 0; i < numberOfBatches; i++) {
      DateTime batchStart = startDate.add(durationPerBatch * i);
      DateTime batchEnd =
          (i == numberOfBatches - 1)
              ? endDate
              : startDate.add(durationPerBatch * (i + 1));
      log(
        'AddEditApartmentCubit: _dividePeriodAcrossBatches: batch #${i + 1}: {\'start\': ${batchStart.toIso8601String().split('T').first}, \'end\': ${batchEnd.toIso8601String().split('T').first}}',
      );
      batches.add({
        'start': batchStart,
        'end': batchEnd,
        'amount': batchAmount,
      });
    }
    this.batches = batches;
    log(
      'AddEditApartmentCubit: _dividePeriodAcrossBatches: batches => $batches',
    );
    return batches;
  }

  void onContractEndDatePick(DateTime? value) {
    if (value != null &&
        selectedPaymentType != null &&
        contractStartDateController.text.isNotEmpty) {
      final startDate = DateTime.parse(
        '${contractStartDateController.text} 00:00:00',
      );
      final endDate = value;
      final batches = _dividePeriodAcrossBatches(
        startDate,
        endDate,
        selectedPaymentType!,
      );
      nextPaymentDate =
          batches[0]['end']!.toIso8601String().split('T').first.toString();
      log(
        'AddEditApartmentCubit: onContractEndDatePick: nextPaymentDate => $nextPaymentDate',
      );
      emit(NextPaymentSelectedState());
    }
  }

  void onContractStartDatePick(DateTime? value) {
    if (value != null &&
        selectedPaymentType != null &&
        contractEndDateController.text.isNotEmpty) {
      final startDate = value;
      final endDate = DateTime.parse(
        '${contractEndDateController.text} 00:00:00',
      );
      final batches = _dividePeriodAcrossBatches(
        startDate,
        endDate,
        selectedPaymentType!,
      );
      nextPaymentDate =
          batches[0]['end']!.toIso8601String().split('T').first.toString();
      log(
        'AddEditApartmentCubit: onContractEndDatePick: nextPaymentDate => $nextPaymentDate',
      );
      emit(NextPaymentSelectedState());
    }
  }

  void _incrementPropertyApartmentsCount(int selectedPropertyId) {
    sl<Database>().rawUpdate(
      'UPDATE ${TableName.propertyTable} SET number_of_apartments = number_of_apartments + 1 WHERE id = ?',
      [selectedPropertyId],
    );
  }

  void _insertBatches(int apartmentId) async {
    for (var batchMap in batches) {
      final batch = PaymentModel(
        id: -1,
        apartmentId: apartmentId.toString(),
        userId: idNumberController.text,
        amount: batchMap['amount'],
        startDate: batchMap['start'],
        endDate: batchMap['end'],
      );

      try {
        final paymentId = await DbHelper.insertData(
          TableName.paymentTable,
          batch.toJson(),
        );
        log('AddEditApartmentCubit: _insertBatches: paymentId => $paymentId');
      } catch (error) {
        log('AddEditApartmentCubit: _insertBatches: error => $error');
      }
    }
  }

  void _updatePaymentBatches(int apartmentId, int numberOfBatches) async {
    log(
      'AddEditApartmentCubit: _updatePaymentBatches: apartmentId => $apartmentId',
    );
    // final isDeleted = await DbHelper.deleteData(
    //   TableName.paymentTable,
    //   apartmentId.toString(),
    //   ['apartment_id'],
    // );

    await sl<Database>().execute('delete from payment where apartment_id = ?', [
      apartmentId,
    ]);
    _insertBatches(apartmentId);
  }
}
