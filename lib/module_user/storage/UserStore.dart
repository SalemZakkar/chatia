import 'package:chatia/logs/messages.dart';
import 'package:chatia/module_user/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStore {
  String settingName = "USERDATA";
  late SharedPreferences sharedPreferences;
  Future<bool> init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    return true;
  }
  void setUser(User user)
  {
    Messages.setSettingSharedPreference(settingName, [user.email , user.password]);
    sharedPreferences.setStringList(settingName, [user.email , user.password]);
  }
  User? getUser()
  {
    List<String>? data = sharedPreferences.getStringList(settingName);
    Messages.getSettingSharedPreferences(settingName, data ?? []);
    if(data == null)
      {
        return null;
      }
    return User(data[0], data[1]);

  }
  void clearUser()
  {
    Messages.clear(settingName);
    sharedPreferences.remove(settingName);
  }
}