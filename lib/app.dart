import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todoshka/presentation/features/tasks/tasks_screen.dart';

import 'common/app_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ru', 'RU'),
      ],
      debugShowCheckedModeBanner: false,
      title: applicationName,
      themeMode: ThemeMode.light,
      home: TasksScreen(),
      // routes: routes,
    );
  }
}
