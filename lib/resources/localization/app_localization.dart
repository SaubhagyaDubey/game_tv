import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:game_tv/resources/localization/localization_japanese.dart';

import 'localization_english.dart';

const String kLanguageEnglish = 'en';
const String kLanguageJapanese = 'ja';
const String kUserName = 'Username';
const String kPassword = 'password';
const String kLogin = 'login';
const String kErrorUsername = 'errorUsername';
const String kErrorPassword = 'errorPassword';
const String kSignUp = 'signUp';
const String kInvalidLogin = 'InvalidLogin';
const String kSomethingWrong = 'SomethingWrong';
const String kAccount = 'Account';
const String kActiveTournaments = 'Active tournaments';
const String kHistory = 'History';
const String kManageBets = 'Manage bets';
const String kSettings = 'Settings';
const String kTournamentsPlayed = 'Tournaments Played';
const String kTournamentsWon = 'Tournaments Won';
const String kWinningPercentage = 'Winning Percentage';
const String kRating = 'Rating';
const String kRecommended = 'Recommended for you';



class ApplicationLocalization {
  final Locale locale;

  ApplicationLocalization(this.locale);

  static ApplicationLocalization of(BuildContext context) =>
      Localizations.of<ApplicationLocalization>(
          context, ApplicationLocalization);

  static Map<String, Map<String, String>> _localizedValues = {
    kLanguageEnglish: EnglishLocalisation.getLocalisation,
    kLanguageJapanese: JapaneseLocalisation.getLocalisation,
  };

  String getText(String tag) {
    if (_localizedValues.containsKey(locale.languageCode) &&
        _localizedValues[locale.languageCode].containsKey(tag)) {
      return _localizedValues[locale.languageCode][tag];
    } else {
      return EnglishLocalisation.getLocalisation[tag];
    }
  }
}
