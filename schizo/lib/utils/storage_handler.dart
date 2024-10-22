import 'package:shared_preferences/shared_preferences.dart';

class StorageHandler {
  static Future<void> setSilentMode(bool isSilent) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('silent_mode', isSilent);
  }

  static Future<bool> getSilentMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('silent_mode') ?? false;
  }
}
