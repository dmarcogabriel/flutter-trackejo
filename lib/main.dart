import 'package:flutter/material.dart';
import 'package:flutter_trackejo/objectives/objectives.page.dart';
import 'package:flutter_trackejo/objectives/objectives_success/objectives_success.page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trackejo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _onGenerateRouter,
    );
  }

  Route<dynamic> _onGenerateRouter(RouteSettings settings) {
    if (settings.name == '/')
      return MaterialPageRoute(builder: (context) => Objectives());
    if (settings.name == '/success')
      return MaterialPageRoute(builder: (context) => ObjectivesSuccess());
  }
}
