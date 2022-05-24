import 'package:chatia/logs/messages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  static String settingName = "THEME_MODE";
  late SharedPreferences sharedPreferences;
  Future<bool> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return true;
  }
  int getActiveTheme() {
    int? active = sharedPreferences.getInt(settingName);
    Messages.getSettingSharedPreferences(settingName, [active.toString()]);
    if (active == null) return 0;
    return active;
  }

  void setTheme(int i) {
    sharedPreferences.setInt(settingName, i);
    Messages.setSettingSharedPreference(settingName, [i.toString()]);

  }
}
ThemeStorage themeStorage = ThemeStorage();