import 'dart:developer' show log;

import 'package:flutter/material.dart' show BuildContext;

import '../localization/app_localization.dart' show AppLocalizations;

extension Transalation on String {
  String tr(BuildContext context) {
    try {
      return AppLocalizations.of(context).translate(this);
    } catch (_) {
      return this;
    }
  }
}

extension Logger on String {
  void logger() => log(this);
}
