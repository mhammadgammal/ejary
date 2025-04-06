import 'package:ejary/core/helpers/cache/database_helper/db_helper.dart';
import 'package:ejary/core/helpers/cache/database_helper/table_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'alarms_state.dart';

class AlarmsCubit extends Cubit<AlarmsState> {
  AlarmsCubit() : super(AlarmsInitial());

  List<Map<String, dynamic>> alarms = List.empty(growable: true);

  Future<void> getAlarms() async {
    emit(GetAlarmsLoading());
    final DateTime oneMonthFromNow = DateTime.now().add(Duration(days: 30));
    alarms = await DbHelper.getDataWhere(
      TableName.apartmentTable,
      where: 'contract_end_date < ? and mark_as_read = 0',
      whereArgs: [oneMonthFromNow.toIso8601String()],
    );
    emit(GetAlarmsSuccess());
  }

  Future<void> deleteAlarm(int apartmentId) async {
    final Map<String, dynamic> tmpAlarms = Map<String, dynamic>.from(
        alarms.firstWhere((e) => e['id'] == apartmentId)
    );
    tmpAlarms['mark_as_read'] = 1; // Now you can modify the map
    await DbHelper.updateData(TableName.apartmentTable, tmpAlarms, 'id = ?', [
      apartmentId,
    ]);
    emit(DeleteAlarmSuccess());
  }
}
