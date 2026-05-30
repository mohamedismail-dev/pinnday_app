import 'package:flutter/material.dart';

class LangProvider extends ChangeNotifier {
  Locale _currentLocale = Locale('en');

  Locale get currentLocale => _currentLocale;

  void toggleLanguage(bool isEnglish) {
    _currentLocale = isEnglish ? Locale('en') : Locale('ar');
    notifyListeners();
  }

  bool get isArabic => _currentLocale.languageCode == 'ar';
  bool get isEnglish => _currentLocale.languageCode == 'en';
}
