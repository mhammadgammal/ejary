import 'package:flutter/material.dart';
import 'package:ejary/core/widgets/text_fields/app_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.controller,
    required this.action,
    required this.onEmailSubmit,
  });

  final TextEditingController controller;
  final TextInputAction action;

  final void Function(String?) onEmailSubmit;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      inputType: TextInputType.emailAddress,
      inputAction: action,
      icon: Icon(Icons.email_outlined),
      onSubmit: onEmailSubmit,
    );
  }
}
