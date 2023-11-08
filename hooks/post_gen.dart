import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger
      .warn('First: You need to add the following to your pubspec.yaml file:');
  context.logger.info('''
dependencies:
  flutter_localizations:
    sdk: flutter

flutter:
  generate: true
          ''');

  context.logger.warn(
      'Second: You need to wrap your MaterialApp/CupertinoApp widget with LocaizationBlocWidget');

  context.logger
      .warn('Third: You need to add the following to your main.dart file:');

  context.logger.info('''
          return MaterialApp(
            supportedLocales: AppTranslation.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          );
          ''');
}
