import 'package:flutter/material.dart';
import 'package:flutter_trackejo/home/create_task/create_task_form.dart';
import 'package:flutter_trackejo/objectives/objectives_page.dart';
import 'package:flutter_trackejo/objectives/objectives_success/objectives_success.page.dart';
import 'package:flutter_trackejo/home/home_page.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/providers/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (_) => TasksProvider(),
          ),
          Provider(
            create: (_) => UserProvider(),
          )
        ],
        child: MaterialApp(
          title: 'Trackejo',
          theme: ThemeData(
            primaryColor: Color(0xffFFA73F),
          ),
          onGenerateRoute: _onGenerateRouter,
        ));
  }

  // todo: break route into another component
  Route<dynamic> _onGenerateRouter(RouteSettings settings) {
    if (settings.name == '/')
      return MaterialPageRoute(builder: (context) => ObjectivesPage());
    if (settings.name == '/success')
      return MaterialPageRoute(builder: (context) => ObjectivesSuccess());
    if (settings.name == '/home-page')
      return MaterialPageRoute(builder: (context) => HomePage());
    if (settings.name == '/create_task')
      return MaterialPageRoute(builder: (context) => CreateTaskForm());
    return MaterialPageRoute(builder: (context) => HomePage());
  }
}
