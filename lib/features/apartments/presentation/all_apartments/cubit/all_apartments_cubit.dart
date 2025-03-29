import 'package:ejary/core/helpers/cache/database_helper/db_helper.dart';
import 'package:ejary/core/helpers/cache/database_helper/table_name.dart';
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

  Future<void> getAllApartments() async {
    emit(GetAllApartmentsLoadingState());
    try {
      apartments = await DbHelper.getDataWhere(
        TableName.apartmentTable,
        ApartmentModel.fromJson,
        where: 'property_id = ?',
        whereArgs: [selectedPropertyId],
      );

      totalApartments = apartments!.length;
      emit(GetAllApartmentsSuccessState());
    } catch (e) {
      emit(GetAllApartmentsErrorState(e.toString()));
    }
  }
}
