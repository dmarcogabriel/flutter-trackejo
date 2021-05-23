import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/home/tasks_view/tasks_view.dart';
import 'package:flutter_trackejo/widgets/page.dart';

class TabPage {
  String title;
  String subTitle;
  Widget content;

  TabPage({this.title, this.content, this.subTitle});
}

class HomePage extends StatelessWidget {
  final List<TabPage> tabPages = [
    TabPage(title: 'Todas'),
    TabPage(title: 'Hoje'),
    TabPage(
        title: 'Atrasadas', subTitle: 'É melhor você conferir essas tarefas!'),
    TabPage(title: 'Em breve'),
  ];

  @override
  Widget build(BuildContext ctx) {
    return DefaultTabController(
        length: tabPages.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [for (TabPage tabPage in tabPages) Text(tabPage.title)],
            ),
          ),
          body: TabBarView(
            children: [
              for (TabPage tabPage in tabPages)
                PageContainer(
                  TasksView(tabPage.title, tabPage.subTitle),
                  noHeader: true,
                )
            ],
          ),
        ));
  }
}
