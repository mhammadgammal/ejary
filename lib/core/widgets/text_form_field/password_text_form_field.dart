import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/widgets/text_form_field/columned_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField(
      {super.key, required this.controller, this.passwordValidation});

  final TextEditingController controller;

  final String? Function(String?)? passwordValidation;
  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  late bool showPassword;

  @override
  void initState() {
    super.initState();
    showPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return ColumnedTextFormField(
      title: 'Password'.tr(context),
      hint: 'Password'.tr(context),
      controller: widget.controller,
      inputType: TextInputType.visiblePassword,
      isPassword: !showPassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        icon: SvgPicture.asset(
          showPassword ? AppIcons.showPasswordIc : AppIcons.hidePasswordIc,
          colorFilter: ColorFilter.mode(AppColors.gray100, BlendMode.srcIn),
        ),
      ),
      validate: widget.passwordValidation,
    );
  }
}
