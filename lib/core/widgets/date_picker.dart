import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/widgets/text_form_field/columned_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DatePicker extends StatelessWidget {
  DatePicker({
    super.key,
    required this.datePickerController,
    required this.datePickerLabel,
    required this.validation,
    this.datePickerHint,
    this.labelColor,
    this.iconColor,
    this.dateColor,
    this.onDatePicked,
  });

  TextEditingController datePickerController;
  final String datePickerLabel;
  final String? validation;
  final String? datePickerHint;
  final Color? labelColor;
  final Color? iconColor;
  final Color? dateColor;
  final void Function(DateTime?)? onDatePicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => showDatePicker(
            context: context,
            initialDate: datePickerController.text.isEmpty
                ? DateTime.now()
                : DateTime.parse(datePickerController.text),
            firstDate: DateTime.parse('1950-01-01'),
            lastDate: DateTime.parse('2030-12-31'),
          ).then((value) {
            onDatePicked?.call(value);
            datePickerController.text = DateFormat(
              'yyyy-MM-dd',
            ).format(value!);
          }),
      child: ColumnedTextFormField(
        controller: datePickerController,
        inputType: TextInputType.datetime,
        title: datePickerLabel,
        titleColor: labelColor,
        hint: datePickerHint,
        hintColor: dateColor,
        enabled: false,
        maxLines: 1,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppIcons.calenderIc),
        ),
        validate: (value) => value == null || value.isEmpty ? validation : null,
      ),
    );
  }
}
