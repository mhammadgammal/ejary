part of 'alarms_cubit.dart';

sealed class AlarmsState {}

final class AlarmsInitial extends AlarmsState {}

final class GetAlarmsLoading extends AlarmsState {}

final class GetAlarmsSuccess extends AlarmsState {}

final class DeleteAlarmSuccess extends AlarmsState {}
