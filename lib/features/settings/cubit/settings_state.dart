part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class GetUserDataSuccessState extends SettingsState {}

final class UpdateUserDataSuccessState extends SettingsState {}

final class GetUserDataErrorState extends SettingsState {
  final String message;

  GetUserDataErrorState(this.message);
}
