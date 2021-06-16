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
  bool _lateTasksNotification = false;
  bool _todayTasksNotification = false;
  bool _doneTasksFeedbackNotification = false;

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

          // todo: tenho que pegar esses valores
          print(asyncSnapshot.data.doneTasksFeedback);
          print(asyncSnapshot.data.lateTasks);
          print(asyncSnapshot.data.todayTasks);

          return PageContainer(
              title: PageTitle(title: 'Notificações'),
              child: ListView(
                children: [
                  SwitchListTile(
                      selected:
                          asyncSnapshot.data.lateTasks, // todo: its working
                      activeColor: Theme.of(ctx).primaryColor,
                      value: _lateTasksNotification,
                      title: Text('Lembrete de tarefas atrasadas'),
                      onChanged: (value) =>
                          _handleLateTasksNotification(ctx, value)),
                  SwitchListTile(
                    selected: asyncSnapshot.data.todayTasks,
                    activeColor: Theme.of(ctx).primaryColor,
                    value: _todayTasksNotification,
                    onChanged: (value) =>
                        _handleTodayTasksNotification(ctx, value),
                    title: Text('Lembrete de tarefas do dia'),
                  ),
                  SwitchListTile(
                    activeColor: Theme.of(ctx).primaryColor,
                    value: _doneTasksFeedbackNotification,
                    onChanged: (value) =>
                        _handleDoneTasksFeedbackNotification(ctx, value),
                    title: Text('Feedback de tarefas concluídas no dia'),
                  ),
                ],
              ));
        });
  }

  void _handleLateTasksNotification(BuildContext ctx, bool value) async {
    this.setState(() {
      _lateTasksNotification = value;
    });
    await _saveNotificationPreference(ctx, 'late_tasks', value);
  }

  void _handleTodayTasksNotification(BuildContext ctx, bool value) async {
    this.setState(() {
      _todayTasksNotification = value;
    });
    await _saveNotificationPreference(ctx, 'today_tasks', value);
  }

  void _handleDoneTasksFeedbackNotification(
      BuildContext ctx, bool value) async {
    this.setState(() {
      _doneTasksFeedbackNotification = value;
    });
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
