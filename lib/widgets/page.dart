import 'package:flutter/widgets.dart';

class PageContainer extends StatelessWidget {
  final Widget child;
  final bool noHeader;

  PageContainer(this.child, {this.noHeader = false});

  @override
  Widget build(BuildContext ctx) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 16, vertical: noHeader ? 16 : 0),
      child: child,
    );
  }
}
