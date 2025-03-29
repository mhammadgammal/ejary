import 'package:ejary/core/helpers/cache/database_helper/db_helper.dart';
import 'package:ejary/core/helpers/cache/database_helper/table_name.dart';
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

  Future<void> getAllProperties() async {
    emit(GetAllPropertiesLoadingState());
    try {
      final propertiesResponse = await DbHelper.getAll(TableName.propertyTable);

      properties =
          propertiesResponse.map((e) => PropertyModel.fromJson(e)).toList();
      availableProperties = properties!.length;

      emit(GetAllPropertiesSuccessState());
    } catch (e) {
      emit(GetAllPropertiesErrorState(e.toString()));
    }
  }
}
