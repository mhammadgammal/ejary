import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_edit_property_state.dart';

class AddEditPropertyCubit extends Cubit<AddEditPropertyState> {
  AddEditPropertyCubit() : super(AddEditPropertyInitial());
}
