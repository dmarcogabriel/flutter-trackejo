import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/helpers/validator.dart';
import 'package:flutter_trackejo/providers/ticket.provider.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';
import 'package:flutter_trackejo/widgets/mol/primary_button.dart';
import 'package:flutter_trackejo/widgets/views/page.dart';
import 'package:provider/provider.dart';

class CreateTicketPage extends StatefulWidget {
  @override
  _CreateTicketPageState createState() => _CreateTicketPageState();
}

class _CreateTicketPageState extends State<CreateTicketPage> {
  String _ticketName;
  int _ticketColor;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<List<int>> _colors = [
    [
      0xffFF9090,
      0xffFFE790,
      0xffBAFF90,
      0xff90FFCA,
    ],
    [
      0xff90FFEB,
      0xff90C3FF,
      0xffB390FF,
      0xffEF90FF,
    ],
    [
      0xffFF6565,
      0xffFCFF60,
      0xff69FF5C,
      0xff6978FF,
    ],
  ];

  void _handleSaveTicket(BuildContext ctx) async {
    if (_formKey.currentState.validate()) {
      Provider.of<TicketProvider>(ctx, listen: false)
          .createTicket(TicketClass(text: _ticketName, color: _ticketColor));
      Navigator.of(ctx).pop(true);
    }
  }

  @override
  Widget build(BuildContext ctx) {
    return PageContainer(
      title: Heading1(
        title: 'Criar Etiqueta',
        color: Colors.white,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 7),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    labelText: 'Nome da Etiqueta',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    isDense: true,
                  ),
                  onChanged: (ticketName) {
                    setState(() {
                      _ticketName = ticketName;
                    });
                  },
                  validator: Validator.validatePresence,
                  cursorColor: Theme.of(ctx).primaryColor,
                )),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 7),
                child: FormField<String>(
                  validator: Validator.validatePresence,
                  builder: (FormFieldState<String> state) {
                    return Container(
                      child: Card(
                        elevation: 4,
                        margin: EdgeInsets.all(7),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              for (List<int> colorList in _colors)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      for (int color in colorList)
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: null,
                                            foregroundColor: null,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: _ticketColor == color
                                                    ? Theme.of(ctx).primaryColor
                                                    : Colors.black54,
                                                width: _ticketColor == color
                                                    ? 2
                                                    : 1,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6)),
                                              color: Color(color),
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _ticketColor = color;
                                              state.didChange(color.toString());
                                            });
                                          },
                                        ),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 64, vertical: 14),
              child: PrimaryButton(
                text: 'Salvar',
                onPressed: () => _handleSaveTicket(ctx),
              ),
            )
          ],
        ),
      ),
    );
  }
}
