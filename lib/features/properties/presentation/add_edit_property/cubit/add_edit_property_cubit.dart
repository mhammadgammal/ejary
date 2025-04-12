import 'dart:developer';

import 'package:ejary/core/helpers/cache/database_helper/db_helper.dart';
import 'package:ejary/core/helpers/cache/database_helper/table_name.dart';
import 'package:ejary/features/properties/data/model/property_model.dart';
import 'package:ejary/features/properties/presentation/all_properties/cubit/all_properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_edit_property_state.dart';

class AddEditPropertyCubit extends Cubit<AddEditPropertyState> {
  AddEditPropertyCubit() : super(AddEditPropertyInitial());

  static AddEditPropertyCubit get(context) => BlocProvider.of(context);

  final TextEditingController propertyNumberController =
      TextEditingController();
  final TextEditingController districtNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var isEditMode = false;

  late PropertyModel propertyModel;

  void loadPropertyData(PropertyModel property) {
    propertyModel = property;
    log(
      'AddEditPropertyCubit: loadPropertyData: ${property.propertyNumber.toString()}',
    );
    propertyNumberController.text = property.propertyNumber.toString();
    districtNameController.text = property.districtName;
    isEditMode = true;
  }

  Future<void> addPropertyToDb(
    BuildContext context, {
    required String picturePath,
  }) async {
    if (isEditMode) {
      _updateProperty(picturePath: picturePath);
    } else {
      final property = PropertyModel(
        id: -1,
        propertyNumber: int.tryParse(propertyNumberController.text) ?? 0,
        districtName: districtNameController.text,
        picturePath: picturePath,
        numberOfApartments: 0,
      );

      int propertyId = await DbHelper.insertData(
        TableName.propertyTable,
        property.toJson(),
      );
      if (propertyId > -1) {
        addToList(context, property..id = propertyId);
        // Property added successfully
        emit(AddEditPropertySuccess());
      } else {
        // Failed to add property
        emit(AddEditPropertyFailure());
      }
    }
  }

  void addToList(BuildContext context, PropertyModel model) {
    AllPropertiesCubit.get(context).unFilteredProperties!.add(model);
    AllPropertiesCubit.get(context).availableProperties++;
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

  void _updateProperty({required String picturePath}) {
    final property = PropertyModel(
      id: propertyModel.id,
      propertyNumber: int.tryParse(propertyNumberController.text) ?? 0,
      districtName: districtNameController.text,
      picturePath: picturePath,
      numberOfApartments: propertyModel.numberOfApartments,
    );

    DbHelper.updateData(TableName.propertyTable, property.toJson(), 'id = ?', [
          propertyModel.id,
        ])
        .then((value) {
          emit(AddEditPropertySuccess());
        })
        .catchError((error) {
          emit(AddEditPropertyFailure());
        });
  }
}
