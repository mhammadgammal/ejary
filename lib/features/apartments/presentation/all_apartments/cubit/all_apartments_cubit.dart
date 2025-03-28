import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_apartments_state.dart';

class AllApartmentsCubit extends Cubit<AllApartmentsState> {
  AllApartmentsCubit() : super(AllApartmentsInitial());

  late int selectedPropertyId;
}
