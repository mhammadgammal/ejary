import 'package:ejary/core/helpers/cache/database_helper/db_helper.dart';
import 'package:ejary/core/helpers/cache/database_helper/table_name.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/features/apartments/data/model/apartment_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'all_apartments_state.dart';

class AllApartmentsCubit extends Cubit<AllApartmentsState> {
  AllApartmentsCubit() : super(AllApartmentsInitial());

  static AllApartmentsCubit get(context) => BlocProvider.of(context);

  late int selectedPropertyId;
  late int selectedPropertyNumber;
  late String selectedPropertyDistrict;

  int totalApartments = 0;

  List<ApartmentModel>? apartments;

  Future<void> getAllApartments([List<ApartmentModel>? apartmentss]) async {
    emit(GetAllApartmentsLoadingState());
    if (apartmentss != null && apartmentss.isNotEmpty) {
      apartments = apartmentss;
      emit(GetAllApartmentsSuccessState());
    } else {
      try {
        final apartmentsResponse = await DbHelper.getDataWhere(
          TableName.apartmentTable,
          where: 'property_id = ?',
          whereArgs: [selectedPropertyId],
        );
        'apartments count: ${apartmentsResponse.length}'.logger();
        apartments =
            apartmentsResponse
                .map((apartment) => ApartmentModel.fromJson(apartment))
                .toList();
        'apartments: ${apartments!.length}'.logger();
        totalApartments = apartments!.length;
        emit(GetAllApartmentsSuccessState());
      } catch (e) {
        emit(GetAllApartmentsErrorState(e.toString()));
      }
    }
  }

  void setSelectedProperty(
    int propertyId,
    int propertyNumber,
    String propertyDistrict,
  ) {
    selectedPropertyId = propertyId;
    selectedPropertyNumber = propertyNumber;
    selectedPropertyDistrict = propertyDistrict;
  }

  Future<void> filterApartments(String value) async {
    apartments!.clear();
    if (value.isEmpty) {
      resetFilter();
    }else{
      final filteredResponse = await DbHelper.getDataWhere(
        TableName.apartmentTable,
        where: 'renter_phone_number LIKE ? OR renter_name LIKE ? and property_id = ?',
        whereArgs: ['%$value%', '%$value%',selectedPropertyId],
      );
      for (var model in filteredResponse) {
        apartments!.add(ApartmentModel.fromJson(model));
      }
      totalApartments = apartments!.length;
      emit(FilterApartments());
    }


  }

  void resetFilter() {
    apartments!.clear();
    getAllApartments();
  }
}
