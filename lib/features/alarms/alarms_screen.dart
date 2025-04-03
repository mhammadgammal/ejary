import 'package:ejary/features/alarms/cubit/alarms_cubit.dart';
import 'package:ejary/features/alarms/widgets/alarms_screen_header.dart';
import 'package:ejary/features/alarms/widgets/empty_alarms_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/alarm_widget.dart';

class AlarmsScreen extends StatelessWidget {
  const AlarmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AlarmsScreenHeader(),
          BlocBuilder<AlarmsCubit, AlarmsState>(
            builder: (context, state) {
              if (context.read<AlarmsCubit>().alarms.isEmpty) {
                return EmptyAlarmsState();
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: context.read<AlarmsCubit>().alarms.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return AlarmWidget(
                      date: DateTime.now(),
                      renterName:
                          context
                              .read<AlarmsCubit>()
                              .alarms[index]['renter_name'],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
