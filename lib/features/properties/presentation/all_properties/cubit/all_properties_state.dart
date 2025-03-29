part of 'all_properties_cubit.dart';

@immutable
sealed class AllPropertiesState {}

final class AllPropertiesInitial extends AllPropertiesState {}

final class GetAllPropertiesLoadingState extends AllPropertiesState {}

final class GetAllPropertiesSuccessState extends AllPropertiesState {}

final class GetAllPropertiesErrorState extends AllPropertiesState {
  final String message;

  GetAllPropertiesErrorState(this.message);
}
