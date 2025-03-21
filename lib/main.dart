import 'package:flutter/material.dart';
import 'package:todo_app/dependencies/dependency.dart' as di;
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:todo_app/screens/home/home_viewmodel.dart';
import 'package:todo_app/screens/view.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = '8whkLNTUiea0sms7KbJlKN84uxrfh73Aws9EM9Pb';
  const keyClientKey = 'DasuATfg9Um4V6u4T3rNy2VWIehj49tN24B4DgCy';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(
    keyApplicationId,
    keyParseServerUrl,
    clientKey: keyClientKey,
    debug: false,
    autoSendSessionId: true,
    liveQueryUrl: keyParseServerUrl,
  );
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(
    View(
      builder: (_, viewmodel, __) => MyApp(
        settingsController: settingsController,
        viewmodel: viewmodel,
      ),
      viewmodel: HomeViewmodel(),
    ),
  );
}
