import 'package:flutter/material.dart';
import 'package:flutter_trackejo/providers/login.provider.dart';
import 'package:flutter_trackejo/providers/notifications.provider.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/providers/ticket.provider.dart';
import 'package:flutter_trackejo/providers/user.dart';
import 'package:flutter_trackejo/widgets/views/loading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'router.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Future<User> _loadUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String email = sharedPreferences.getString('@logged_user');
    String name = sharedPreferences.getString('@$email:name');
    if (email == null && name == null) return null;
    return User(email: email, name: name);
  }

  @override
  Widget build(BuildContext ctx) {
    return FutureBuilder<User>(
        future: _loadUser(),
        builder: (BuildContext ctx, AsyncSnapshot<User> asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting)
            return MaterialApp(title: "Carregando...", home: LoadingPage());

          return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => TasksProvider(),
                ),
                Provider(create: (_) => UserProvider(user: asyncSnapshot.data)),
                Provider(create: (_) => LoginProvider()),
                Provider(create: (_) => NotificationsProvider()),
                ChangeNotifierProvider(create: (_) => TicketProvider()),
              ],
              child: MaterialApp(
                title: 'Trackejo',
                theme: ThemeData(
                  primaryColor: Color(0xffFFA73F),
                  primaryColorLight: Color(0xffF2C94C),
                ),
                onGenerateRoute: (routeSettings) {
                  return AppRouter.onGenerateRouter(routeSettings, ctx);
                },
              ));
        });
  }
}
