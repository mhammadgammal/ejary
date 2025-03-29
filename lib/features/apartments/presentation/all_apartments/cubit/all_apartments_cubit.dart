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
}
