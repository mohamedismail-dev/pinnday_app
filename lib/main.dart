import 'package:pinnday_app/core/lang/lang_provider.dart';
import 'package:pinnday_app/core/theme/app_text_style.dart';
import 'package:pinnday_app/core/theme/app_theme.dart';
import 'package:pinnday_app/core/theme/theme_provider.dart';
import 'package:pinnday_app/ui/services/firebase_options.dart';
import 'package:pinnday_app/generated/l10n.dart';
import 'package:pinnday_app/ui/starting/setup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LangProvider()),
      ],

      child: Consumer2<ThemeProvider, LangProvider>(
        builder: (context, themeProvider, langProvider, child) {
          return MaterialApp(
            locale: langProvider.currentLocale,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            home: SetupScreen(),
            theme: AppTheme.lightTheme.copyWith(
              textTheme: AppTextStyle.getTextTheme(
                isArabic: langProvider.isArabic,
                isDark: false,
              ),
            ),
            darkTheme: AppTheme.darkTheme.copyWith(
              textTheme: AppTextStyle.getTextTheme(
                isArabic: langProvider.isArabic,
                isDark: true,
              ),
            ),
            themeMode: themeProvider.themeMode,
          );
        },
      ),
    );
  }
}
