// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:sasix/l10n/l10n.dart';
import 'package:get_storage/get_storage.dart';

class SettingsProvider extends ChangeNotifier {
  String selectedLocale = GetStorage().read('selectedLocale');
  late Locale? _locale =
      selectedLocale != null ? Locale(selectedLocale) : const Locale('en');

  int colorCode = GetStorage().read('selectedThemeCode');
  late Color _themeColor = colorCode == 0 ? Colors.redAccent : Colors.redAccent;

  // then we will define getter and setter for the (selected)language
  Locale? get local {
    return _locale;
  }

  // to set a new local language
  void setLocale(Locale locale) {
    // here the condition is in case if the user selects from the phone's setting a language we don't support, then we don't set the locale.

    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

// to clear the setted language
  void clearLocale() {
    _locale = null;
    notifyListeners();
  }

  // setter and getter for theme color
  Color? get themeColor {
    return _themeColor;
  }

  void setTheme(int colorCode) {
    if (colorCode == 0) {
      _themeColor = Colors.redAccent;
    }
    notifyListeners();
  }
}
