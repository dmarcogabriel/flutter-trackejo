import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/helpers/snackbar.dart';
import 'package:flutter_trackejo/providers/notifications.provider.dart';
import 'package:flutter_trackejo/widgets/views/loading.dart';
import 'package:flutter_trackejo/widgets/views/page.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  Future<NotificationsPreferences> _loadNotificationsPreferences(
    BuildContext ctx,
  ) async {
    return await Provider.of<NotificationsProvider>(ctx)
        .getNotificationsPreference();
  }

  @override
  Widget build(BuildContext ctx) {
    return FutureBuilder<NotificationsPreferences>(
        future: _loadNotificationsPreferences(ctx),
        builder: (
          BuildContext ctx,
          AsyncSnapshot<NotificationsPreferences> asyncSnapshot,
        ) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting)
            return MaterialApp(title: "Carregando...", home: LoadingPage());

          return PageContainer(
              title: PageTitle(title: 'Notificações'),
              child: ListView(
                children: [
                  SwitchListTile(
                      activeColor: Theme.of(ctx).primaryColor,
                      value: asyncSnapshot.data.lateTasks,
                      title: Text('Lembrete de tarefas atrasadas'),
                      onChanged: (value) =>
                          _handleLateTasksNotification(ctx, value)),
                  SwitchListTile(
                    activeColor: Theme.of(ctx).primaryColor,
                    value: asyncSnapshot.data.todayTasks,
                    onChanged: (value) =>
                        _handleTodayTasksNotification(ctx, value),
                    title: Text('Lembrete de tarefas do dia'),
                  ),
                  SwitchListTile(
                    activeColor: Theme.of(ctx).primaryColor,
                    value: asyncSnapshot.data.doneTasksFeedback,
                    onChanged: (value) =>
                        _handleDoneTasksFeedbackNotification(ctx, value),
                    title: Text('Feedback de tarefas concluídas no dia'),
                  ),
                ],
              ));
        });
  }

  void _handleLateTasksNotification(BuildContext ctx, bool value) async {
    await _saveNotificationPreference(ctx, 'late_tasks', value);
  }

  void _handleTodayTasksNotification(BuildContext ctx, bool value) async {
    await _saveNotificationPreference(ctx, 'today_tasks', value);
  }

  void _handleDoneTasksFeedbackNotification(
      BuildContext ctx, bool value) async {
    await _saveNotificationPreference(ctx, 'done_tasks_feedback', value);
  }

  Future<void> _saveNotificationPreference(
      BuildContext ctx, String preference, bool value) async {
    bool success = await Provider.of<NotificationsProvider>(ctx, listen: false)
        .saveNotificationPreference(preference, value);
    if (success == true) {
      TCSnackbar.showSnackbar(ctx: ctx, text: 'Opção de notificação salva!');
    }
  }
}
