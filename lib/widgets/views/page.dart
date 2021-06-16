import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';

class PageTitle extends StatelessWidget {
  final String title;

  PageTitle({@required this.title});

  @override
  Widget build(BuildContext ctx) {
    return Heading1(
      title: title,
      color: Colors.white,
    );
  }
}

class PageContainer extends StatelessWidget {
  final Widget child;
  final Widget title;
  final AppBar appBar;
  final bool hideAppBar;
  final String appBarTheme;
  final List<Widget> appBarActions;

  PageContainer({
    @required this.child,
    @required this.title,
    this.appBar,
    this.hideAppBar = false,
    this.appBarTheme = 'primary',
    this.appBarActions,
  });

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: this.hideAppBar
          ? null
          : appBar ??
              AppBar(
                backgroundColor: _setBackgroundColor(ctx),
                iconTheme: _setIconThemeData(),
                title: title,
                centerTitle: true,
                actions: appBarActions ?? [],
              ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: child,
      ),
    );
  }

  Color _setBackgroundColor(BuildContext ctx) {
    if (appBarTheme == 'light')
      return Colors.white;
    else
      return Theme.of(ctx).primaryColor;
  }

  IconThemeData _setIconThemeData() {
    Color color;
    if (appBarTheme == 'light')
      color = Colors.black;
    else
      color = Colors.white;

    return IconThemeData(color: color);
  }
}
