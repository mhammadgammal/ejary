import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/features/alarms/cubit/alarms_cubit.dart';
import 'package:ejary/features/alarms/widgets/alarms_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
              if(context.read<AlarmsCubit>().alarms.isEmpty){
                return Column(
                  spacing: 10.0.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      width: 162.5.w,
                      height: 150.0.h,
                      AppIcons.bellIc,
                      colorFilter: ColorFilter.mode(
                        AppColors.gray50,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      'No Alarms Yet'.tr(context),
                    ),
                  ],
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: context.read<AlarmsCubit>().alarms.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return AlarmWidget(
                      date: DateTime.now(),
                      renterName: context.read<AlarmsCubit>().alarms[index]['renter_name'],
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
