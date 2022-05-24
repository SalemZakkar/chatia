import 'package:chatia/logs/messages.dart';
import 'package:chatia/module_theme/storage/sharedpreferences.dart';

class ThemeManager {
  static void setTheme(int i) {
    themeStorage.setTheme(i);
    Messages.setTheme(i.toString());
  }

  static int getTheme() {
    return themeStorage.getActiveTheme();
  }
}


