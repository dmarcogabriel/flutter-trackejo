import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.check),
          title: Text('Tarefas Concluídas'),
          onTap: () => _handleNavigation(ctx, 'tickets-done'),
        ),
        ListTile(
            leading: Icon(Icons.waterfall_chart),
            title: Text('Produtividade da semana'),
            onTap: () => _handleNavigation(ctx, 'productivity/weekly')),
        ListTile(
            leading: Icon(Icons.ac_unit), // todo: change this icon
            title: Text('Produtividade por etiqueta'),
            onTap: () => _handleNavigation(ctx, 'productivity/ticket')),
        ListTile(
          leading: Icon(Icons.notifications_none_outlined),
          title: Text('Notificações'),
        ),
      ],
    );
  }

  void _handleNavigation(BuildContext ctx, String routeName) {
    Navigator.pushNamed(ctx, "/home-page/$routeName");
  }
}
