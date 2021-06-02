import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/home/sidemenu.dart';
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
              indicatorColor: Colors.white,
              tabs: [
                for (TabPage tabPage in tabPages)
                  _buildTabTitle(
                    tabPage.title,
                  )
              ],
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
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _navigateToCreateTask(ctx),
            backgroundColor: Theme.of(ctx).primaryColor,
          ),
          drawer: Drawer(child: SideMenu()),
        ));
  }

  Widget _buildTabTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7),
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _navigateToCreateTask(BuildContext ctx) async {
    final result = await Navigator.pushNamed(ctx, '/create_task');

    if (result == true) {
      // todo: reload page
    }
  }
}
