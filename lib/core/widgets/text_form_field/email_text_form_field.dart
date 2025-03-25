import 'package:ejary/core/utils/validators.dart';
import 'package:ejary/core/widgets/text_form_field/columned_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailTextFormField extends StatefulWidget {
  const EmailTextFormField({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  @override
  Widget build(BuildContext context) {
    return ColumnedTextFormField(
      title: widget.label,
      hint: widget.label,
      controller: widget.controller,
      inputType: TextInputType.emailAddress,
      validate: (value) => Validators.validateEmail(context, value),
    );
  }
}
