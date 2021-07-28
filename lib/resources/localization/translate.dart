
import 'package:flutter/material.dart';
import 'package:game_tv/main.dart';

import 'app_localization.dart';

extension StringUtilss on String {
  String  translation(BuildContext context) {
    return ApplicationLocalization.of(context)
        .getText(this);
  }
}
