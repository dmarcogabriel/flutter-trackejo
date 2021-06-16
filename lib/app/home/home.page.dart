import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/home/create_task/create_task_form.dart';
import 'package:flutter_trackejo/app/home/tab_pages/late_tab.dart';
import 'package:flutter_trackejo/app/home/tab_pages/next_tab.dart';
import 'package:flutter_trackejo/app/home/tab_pages/today_tab.dart';
import 'package:flutter_trackejo/app/home/widgets/tab_title.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/widgets/views/task_list.dart';
import 'package:provider/provider.dart';
import 'sidemenu/sidemenu.dart';
import 'package:flutter_trackejo/widgets/page.dart';

class TabPage {
  String title;
  String subTitle;
  Widget content;
  String id;
  List<Task> tasks = [];

  TabPage({
    @required this.id,
    @required this.title,
    this.content,
    this.subTitle,
    this.tasks,
  });
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TabPage> tabPages = [
    // TabPage(title: 'Todas', id: 'all'),
    TabPage(title: 'Hoje', id: 'today'),
    TabPage(
      id: 'late',
      title: 'Atrasadas',
      subTitle: 'É melhor você conferir essas tarefas!',
    ),
    TabPage(id: 'next', title: 'Em breve'),
  ];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Provider.of<TasksProvider>(context, listen: false).loadTasks();
  }

  void _navigateToCreateTask(BuildContext ctx) async {
    final result = await Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (_) => CreateTaskPage()));
    if (result == true) {
      _reloadPage(ctx);
    }
  }

  void _reloadPage(ctx) {
    // todo: reload page
  }

  Widget _buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      leading: IconButton(
          icon: Icon(Icons.person_outline_rounded),
          onPressed: () => _scaffoldKey.currentState.openDrawer()),
      bottom: TabBar(
        indicatorColor: Colors.white,
        tabs: tabPages
            .map((tabPage) => HomeTabTitle(
                  title: tabPage.title,
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext ctx) {
    return DefaultTabController(
        length: tabPages.length,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(child: SideMenu()),
          appBar: _buildAppBar(),
          body: TabBarView(
              children: tabPages.map((tabPage) {
            switch (tabPage.id) {
              case 'today':
                return TodayTab(tabPage: tabPage);
                break;
              case 'late':
                return LateTab(tabPage: tabPage);
                break;
              case 'next':
                return NextTab(tabPage: tabPage);
                break;
              default:
                return PageContainer(
                  TaskList(
                      title: tabPage.title,
                      subTitle: tabPage.subTitle,
                      tasks: tabPage.tasks ?? []),
                  noHeader: true,
                );
            }
          }).toList()),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _navigateToCreateTask(ctx),
            backgroundColor: Theme.of(ctx).primaryColor,
          ),
        ));
  }
}
