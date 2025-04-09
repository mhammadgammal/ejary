import 'package:ejary/core/assets/app_images.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button_with_arrow_icon.dart';
import 'package:ejary/core/widgets/text_form_field/password_text_form_field.dart';
import 'package:ejary/core/widgets/text_form_field/phone_number_form_field.dart';
import 'package:ejary/features/sign_in/screen/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SignInCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Padding(
            padding: EdgeInsets.only(
              left: 40.0.w,
              right: 40.0.w,
              bottom: 20.0.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  width: 550.0.w,
                  AppImages.houses,
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                SizedBox(
                  width: 550.0.w,
                  child: PhoneNumberFormField(
                    controller: cubit.phoneController,
                  ),
                ),
                SizedBox(height: 10.0.h),
                SizedBox(
                  width: 550.0.w,
                  child: PasswordTextFormField(
                    controller: cubit.passwordController,
                  ),
                ),
                SizedBox(height: 40.0.h),
                CustomFilledButtonWithArrowIcon(
                  width: 550.0.w,
                  height: 50.0.h,
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.signIn();
                    }
                  },
                  title: 'Sign In'.tr(context),
                  fontSize: 18,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
