part of 'add_edit_property_cubit.dart';

@immutable
sealed class AddEditPropertyState {}

final class AddEditPropertyInitial extends AddEditPropertyState {}

final class AddEditPropertySuccess extends AddEditPropertyState {
  final bool isEdit;

  AddEditPropertySuccess(this.isEdit);
}

final class AddEditPropertyFailure extends AddEditPropertyState {
  final String message;

  AddEditPropertyFailure({this.message = 'Failed to add property'});
}
