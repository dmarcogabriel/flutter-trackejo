import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/providers/user.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';
import 'package:flutter_trackejo/helpers/user_name.dart';

class MenuUserSession extends StatelessWidget {
  final User loggedUser;
  final void Function() refreshPage;

  MenuUserSession({@required this.loggedUser, @required this.refreshPage});

  @override
  Widget build(BuildContext ctx) {
    if (loggedUser != null)
      return Column(
        children: [
          Heading1(
            title: UserNameHelper.getFirstAndLastNames(loggedUser.name),
          ),
          Heading2(title: loggedUser.email)
        ],
      );
    return TextButton(
        child:
            Text('Entrar', style: TextStyle(color: Theme.of(ctx).primaryColor)),
        onPressed: () => _navigateToLogin(ctx));
  }

  void _navigateToLogin(BuildContext ctx) async {
    String result = await Navigator.of(ctx).pushNamed('/login');
    if (result == 'refresh') refreshPage();
  }
}
