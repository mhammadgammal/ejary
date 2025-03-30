import 'package:ejary/core/helpers/cache/database_helper/db_helper.dart';
import 'package:ejary/core/helpers/cache/database_helper/table_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'alarms_state.dart';

class AlarmsCubit extends Cubit<AlarmsState> {
  AlarmsCubit() : super(AlarmsInitial());

  List<Map<String, dynamic>> alarms = [];

  Future<void> getAlarms() async {
    emit(GetAlarmsLoading());
    final DateTime oneMonthFromNow = DateTime.now().add(Duration(days: 30));
    alarms = await DbHelper.getDataWhere(
      TableName.apartmentTable,
      where: 'contract_end_date < ?',
      whereArgs: [oneMonthFromNow.toIso8601String()],
    );
    emit(GetAlarmsSuccess());
  }
}
