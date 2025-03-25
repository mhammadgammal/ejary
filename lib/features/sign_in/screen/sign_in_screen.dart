import 'package:ejary/core/router/app_navigator.dart';
import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/widgets/dialog_helper/dialog_helper.dart';
import 'package:ejary/features/sign_in/screen/cubit/sign_in_cubit.dart';
import 'package:ejary/features/sign_in/screen/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/logo_section.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            'Navigate to home screen'.logger();
            AppNavigator.navigateAndFinishAll(context, RouteKeys.home);
          } else if (state is SignInFailureState) {
            DialogHelper.showFailureDialog(context, state.message);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: SignInForm()),
                  Expanded(child: LogoSection()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
