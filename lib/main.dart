import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:game_tv/core/bloc/login_bloc/login_bloc.dart';
import 'package:game_tv/core/bloc/tournament_bloc/tournament_bloc.dart';
import 'package:game_tv/resources/localization/app_localization.dart';
import 'package:game_tv/ui/screens/login_screen.dart';

import 'core/bloc/login_bloc/login_state.dart';
import 'core/bloc/tournament_bloc/tournament_state.dart';
import 'resources/localization/localization_delegate.dart';

void main() {
  runApp(MyApp());
}
BuildContext contextForLocalization;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    contextForLocalization = context;
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) =>
              LoginBloc(LoginBlocStateInitState()),),
        BlocProvider<TournamentBloc>(
          create: (context) =>
              TournamentBloc(TournamentBlocStateInitState()),),
      ],
      child: MaterialApp(
        title: 'Game TV',
        theme: ThemeData(
          fontFamily: 'Roboto',
        ),
//locale: Locale(kLanguageJapanese,''),
          localizationsDelegates: [
            // A class which loads the translations
            ApplicationLocalizationDelegate(),
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
            // Built-in localization of basic text for Cupertino widgets
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale(kLanguageJapanese,''),
            const Locale(kLanguageEnglish,''),
          ],
        home: LoginScreen()
        ),
    );
  }
}

