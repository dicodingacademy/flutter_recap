import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  final Future<SharedPreferences> pref;

  SharedPreferenceService(this.pref);

  static const dailyMessage = "DAILY_MESSAGE";

  Future<bool> get isDailyMessageOn async {
    final sharedPref = await pref;
    return sharedPref.getBool(dailyMessage) ?? false;
  }

  void setDailyMessage(bool value) async {
    final sharedPref = await pref;
    sharedPref.setBool(dailyMessage, value);
  }
}
