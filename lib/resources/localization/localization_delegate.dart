import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'app_localization.dart';

class ApplicationLocalizationDelegate
    extends LocalizationsDelegate<ApplicationLocalization> {
  const ApplicationLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => [kLanguageEnglish,
    kLanguageJapanese]
      .contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate old) => false;

  @override
  Future<ApplicationLocalization> load(Locale locale) => SynchronousFuture<ApplicationLocalization>(
      ApplicationLocalization(locale));
}
