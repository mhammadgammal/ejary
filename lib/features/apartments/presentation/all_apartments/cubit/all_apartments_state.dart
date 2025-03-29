part of 'all_apartments_cubit.dart';

@immutable
sealed class AllApartmentsState {}

final class AllApartmentsInitial extends AllApartmentsState {}

final class GetAllApartmentsLoadingState extends AllApartmentsState {}

final class GetAllApartmentsSuccessState extends AllApartmentsState {}

final class GetAllApartmentsErrorState extends AllApartmentsState {
  final String message;

  GetAllApartmentsErrorState(this.message);
}
