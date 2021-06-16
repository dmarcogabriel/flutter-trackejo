import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/home/sidemenu/notifications.page.dart';
import 'package:flutter_trackejo/app/home/sidemenu/user_session.dart';
import 'package:flutter_trackejo/helpers/user_name.dart';
import 'package:flutter_trackejo/providers/login.provider.dart';
import 'package:flutter_trackejo/providers/user.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';
import 'package:provider/provider.dart';
import 'tickets_productivity.dart';
import 'weekly_productivity.dart';
import 'tasks_done.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  User _loggedUser;

  void _loadUser(BuildContext ctx) {
    this.setState(() {
      _loggedUser = Provider.of<UserProvider>(ctx).getCurrentUser();
    });
  }

  void _refreshPage(BuildContext ctx) {
    this.setState(() {
      _loggedUser =
          Provider.of<UserProvider>(ctx, listen: false).getCurrentUser();
    });
  }

  @override
  Widget build(BuildContext ctx) {
    _loadUser(ctx);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: _loggedUser != null
              ? CircleAvatar(
                  backgroundColor: Colors.white,
                  child: BigText(
                    title: UserNameHelper.getNameInitials(
                        _loggedUser.name ?? 'MM'),
                    color: Theme.of(ctx).primaryColor,
                  ),
                )
              : Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                  size: 150,
                ),
          // child: ,
          decoration: BoxDecoration(color: Theme.of(ctx).primaryColor),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: MenuUserSession(
              loggedUser: _loggedUser,
              refreshPage: () => _refreshPage(ctx),
            )),
        ListTile(
          leading: Icon(Icons.check),
          title: Text('Tarefas Concluídas'),
          onTap: () => _handleNavigation(ctx, TasksDone()),
        ),
        ListTile(
          leading: Icon(Icons.waterfall_chart),
          title: Text('Produtividade da Semana'),
          onTap: () => _handleNavigation(ctx, ProductivityWeekly()),
        ),
        ListTile(
          leading: Icon(Icons.ac_unit), // todo: change this icon
          title: Text('Produtividade por Etiqueta'),
          onTap: () => _handleNavigation(ctx, TicketsProductivity()),
        ),
        ListTile(
          leading: Icon(Icons.notifications_none_outlined),
          title: Text('Notificações'),
          onTap: () => _handleNavigation(ctx, NotificationsPage()),
        ),
        ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            onTap: () => _handleLogout(ctx)),
      ],
    );
  }

  void _handleNavigation(BuildContext ctx, Widget page) {
    Navigator.pop(ctx);
    Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => page));
  }

  void _handleLogout(BuildContext ctx) async {
    await Provider.of<LoginProvider>(ctx, listen: false).logout();
    Provider.of<UserProvider>(ctx, listen: false).setCurrentUser(null);
    _refreshPage(ctx);
  }
}
