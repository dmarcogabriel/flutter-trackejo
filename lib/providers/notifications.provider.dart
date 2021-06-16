import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsPreferences {
  bool lateTasks;
  bool todayTasks;
  bool doneTasksFeedback;

  NotificationsPreferences({
    @required this.todayTasks,
    @required this.doneTasksFeedback,
    @required this.lateTasks,
  });
}

class NotificationsProvider {
  Future<bool> saveNotificationPreference(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool('@notification:$key', value);
  }

  Future<NotificationsPreferences> getNotificationsPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool lateTasks = preferences.getBool("@notification:late_tasks");
    bool todayTasks = preferences.getBool("@notification:today_tasks");
    bool doneTasksFeedback =
        preferences.getBool("@notification:done_tasks_feedback");
    return NotificationsPreferences(
      todayTasks: todayTasks ?? false,
      doneTasksFeedback: doneTasksFeedback ?? false,
      lateTasks: lateTasks ?? false,
    );
  }
}
