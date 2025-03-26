import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/core/utils/validators.dart';
import 'package:ejary/core/widgets/text_form_field/columned_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmailTextFormField extends StatefulWidget {
  const EmailTextFormField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  @override
  Widget build(BuildContext context) {
    return ColumnedTextFormField(
      title: AppStrings.email.tr(context),
      hint: AppStrings.email.tr(context),
      controller: widget.controller,
      inputType: TextInputType.emailAddress,
      suffixIcon: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          AppIcons.email,
          colorFilter: ColorFilter.mode(AppColors.gray100, BlendMode.srcIn),
        ),
      ),
      validate: (value) => Validators.validateEmail(context, value),
    );
  }
}
