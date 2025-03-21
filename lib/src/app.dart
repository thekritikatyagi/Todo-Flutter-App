import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:todo_app/common/themes.dart';
import 'package:todo_app/screens/home/home_view.dart';
import 'package:todo_app/screens/home/home_viewmodel.dart';
import 'package:todo_app/screens/onboarding/onboarding_page.dart';
import 'package:todo_app/screens/stateful_wrapper.dart';
import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  final HomeViewmodel viewmodel;
  const MyApp({
    Key? key,
    required this.settingsController,
    required this.viewmodel,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        IsFirstRun.isFirstRun().then((value) {
          viewmodel.isFirstRun = value;
        });
      },
      child: AnimatedBuilder(
        animation: settingsController,
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            defaultTransition: kIsWeb ? Transition.fadeIn : Transition.native,
            debugShowCheckedModeBanner: false,
            //restorationScopeId: 'app',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: settingsController.themeMode,
            home: viewmodel.isFirstRun == true
                ? const OnboardingPage()
                : const HomeView(),
          );
        },
      ),
    );
  }
}
