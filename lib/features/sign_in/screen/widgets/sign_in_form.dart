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
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextButton.icon(
                //   onPressed: () {
                //     final nextLocale =
                //         sl<CacheHelper>().getString(
                //                   key: CacheKeys.languageCode,
                //                 ) ==
                //                 'en'
                //             ? 'ar'
                //             : 'en';
                //     log("SignInForm: change language to $nextLocale");
                //     AppCubit.get(context).changeLanguage(Locale(nextLocale));
                //   },
                //   label: Text(
                //     AppCubit.get(context).locale.languageCode == 'en'
                //         ? "العربيه"
                //         : "English",
                //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                //       fontSize: 22.sp,
                //       fontWeight: FontWeight.w500
                //     ),
                //   ),
                //   icon: Icon(Icons.public, color: AppColors.gray, size: 28.dm),
                //   iconAlignment: AppCubit.get(context).locale.languageCode == 'en'? IconAlignment.start: IconAlignment.end,
                // ),
                SvgPicture.asset(
                  width: 550.0.w,
                  height: 412.0.h,
                  AppImages.houses,
                ),
                PhoneNumberFormField(controller: cubit.phoneController),
                SizedBox(height: 10.0.h),
                PasswordTextFormField(controller: cubit.passwordController),
                // SizedBox(height: 20.0.h),
                // Row(
                //   children: [
                //     Checkbox(
                //       value: cubit.rememberMe,
                //       activeColor: AppColors.primary100,
                //       onChanged: (value) {
                //         cubit.changeRememberMe(value);
                //       },
                //     ),
                //     Text(
                //       'Save Data for next time'.tr(context),
                //       style: Theme.of(
                //         context,
                //       ).textTheme.bodyMedium!.copyWith(fontSize: 18.sp),
                //     ),
                //   ],
                // ),
                SizedBox(height: 40.0.h),
                CustomFilledButtonWithArrowIcon(
                  width: double.infinity,
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
