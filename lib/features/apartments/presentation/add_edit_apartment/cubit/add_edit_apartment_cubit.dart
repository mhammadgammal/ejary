import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_edit_apartment_state.dart';

class AddEditApartmentCubit extends Cubit<AddEditApartmentState> {
  AddEditApartmentCubit() : super(AddEditApartmentInitial());

  static AddEditApartmentCubit get(context) => BlocProvider.of(context);
}
