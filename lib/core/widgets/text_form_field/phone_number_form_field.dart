import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/utils/validators.dart';
import 'package:ejary/core/widgets/text_form_field/columned_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneNumberFormField extends StatefulWidget {
  const PhoneNumberFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PhoneNumberFormField> createState() => _PhoneNumberFormFieldState();
}

class _PhoneNumberFormFieldState extends State<PhoneNumberFormField> {
  @override
  Widget build(BuildContext context) {
    return ColumnedTextFormField(
      title: AppStrings.phoneNumber.tr(context),
      hint: AppStrings.phoneNumber.tr(context),
      controller: widget.controller,
      inputType: TextInputType.emailAddress,
      suffixIcon: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          AppIcons.phone,
          colorFilter: ColorFilter.mode(AppColors.gray100, BlendMode.srcIn),
        ),
      ),
      validate: (value) => Validators.validateEmail(context, value),
    );
  }
}
