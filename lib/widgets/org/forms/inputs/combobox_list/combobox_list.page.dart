import 'package:flutter/material.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';
import 'package:flutter_trackejo/widgets/page.dart';

class ComboboxListPage extends StatefulWidget {
  @override
  _ComboboxListPageState createState() => _ComboboxListPageState();
}

class _ComboboxListPageState extends State<ComboboxListPage> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Heading1(
          title: 'Nome da pag',
          color: Colors.white,
        ),
      ),
      body: PageContainer(
        Column(
          children: [
            ListTile(
              title: Text('Test'),
              trailing: Radio(
                groupValue: 'yes',
                value: 'first',
                onChanged: (value) => print(value),
              ),
            )
          ],
        ),
        noHeader: true,
      ),
    );
  }
}
