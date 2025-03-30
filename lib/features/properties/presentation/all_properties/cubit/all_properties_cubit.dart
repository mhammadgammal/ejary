import 'package:ejary/core/helpers/cache/database_helper/db_helper.dart';
import 'package:ejary/core/helpers/cache/database_helper/table_name.dart';
import 'package:ejary/features/apartments/data/model/apartment_model.dart';
import 'package:ejary/features/properties/data/model/property_model.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_properties_state.dart';

class AllPropertiesCubit extends Cubit<AllPropertiesState> {
  int availableProperties = 0;

  AllPropertiesCubit() : super(AllPropertiesInitial());

  static AllPropertiesCubit get(BuildContext context) =>
      BlocProvider.of(context);

  List<PropertyModel>? properties;
  List<PropertyModel>? unFilteredProperties;

  List<ApartmentModel> models = [];

  Future<void> getAllProperties() async {
    emit(GetAllPropertiesLoadingState());
    try {
      final propertiesResponse = await DbHelper.getAll(TableName.propertyTable);

      unFilteredProperties =
          properties =
              propertiesResponse.map((e) => PropertyModel.fromJson(e)).toList();

      availableProperties = properties!.length;

      emit(GetAllPropertiesSuccessState());
    } catch (e) {
      emit(GetAllPropertiesErrorState(e.toString()));
    }
  }

  Future<void> filterProperties(String value) async {
    models.clear();
    if(value.isEmpty){
      resetFilter();
    }
    else {
      final filteredResponse = await DbHelper.getDataWhere(
        TableName.apartmentTable,
        where: 'renter_phone_number LIKE ? OR renter_name LIKE ?',
        whereArgs: ['%$value%', '%$value%'],
      );

      for (var model in filteredResponse) {
        models.add(ApartmentModel.fromJson(model));
      }

      properties =
          unFilteredProperties!
              .where(
                (element) =>
            models
                .where((e) => e.propertyId == element.id)
                .isNotEmpty,
          )
              .toList();
      availableProperties = properties!.length;
      emit(FilterProperties());
    }
  }

  void resetFilter(){
    models.clear();
    properties = unFilteredProperties;
    availableProperties = properties!.length;
    emit(FilterProperties());
  }
}
