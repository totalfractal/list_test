import 'package:flutter/material.dart';
import 'package:list_test/ui/themes.dart';

class SettingsInteractor with ChangeNotifier {
  ThemeData? _themeData;

  ThemeData get themeData {
    _themeData ??= Themes.lightTheme;
    return _themeData!;
  }

  switchTheme() async {
    _themeData = _themeData == Themes.lightTheme ? Themes.darkTheme : Themes.lightTheme;
    notifyListeners();
  }
}
