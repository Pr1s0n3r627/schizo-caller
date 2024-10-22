import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../models/caller_character.dart';
import '../screens/call_screen.dart';

class CallScheduler {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    _notificationsPlugin.initialize(initializationSettings);
  }

  static void scheduleRandomCall(CallerCharacter character) {
    // Schedule a random call notification
    _notificationsPlugin.show(
      0,
      character.name,
      'Incoming call from ${character.phoneNumber}',
      NotificationDetails(
        android: AndroidNotificationDetails(
          'call_channel',
          'Calls',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }
}
