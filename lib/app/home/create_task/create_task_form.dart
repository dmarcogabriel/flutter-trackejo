import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/app/home/create_task/create_ticket.page.dart';
import 'package:flutter_trackejo/helpers/validator.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/providers/ticket.provider.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';
import 'package:flutter_trackejo/widgets/mol/primary_button.dart';
import 'package:flutter_trackejo/widgets/org/forms/forms_generator.dart';
import 'package:flutter_trackejo/widgets/org/forms/inputs/chips.dart';
import 'package:flutter_trackejo/widgets/org/forms/inputs/datepicker.dart';
import 'package:flutter_trackejo/widgets/org/forms/inputs/text_input.dart';
import 'package:flutter_trackejo/widgets/page.dart';
import 'package:provider/provider.dart';

class CreateTaskPage extends StatefulWidget {
  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  String description;
  String priority;
  String ticket;
  String deadline;
  List<String> priorities;
  int _color;
  final _formKey = GlobalKey<FormState>();

  _CreateTaskPageState() {
    priorities = ['Baixa', 'Média', 'Alta'];
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Heading1(
          title: 'Criar Tarefa',
          color: Colors.white,
        ),
      ),
      body: PageContainer(
        Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              labelText: 'O que precisa fazer?',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              isDense: true,
                              hintText: 'ex: Correr na pista...'),
                          onChanged: (description) => _handleChangeInput(() {
                            this.description = description;
                          }),
                          validator: Validator.validatePresence,
                          cursorColor: Theme.of(ctx).primaryColor,
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: FormField<String>(
                            initialValue: priority,
                            validator: Validator.validatePresence,
                            builder: (FormFieldState<String> state) {
                              return ChipsInput(
                                label: 'Prioridade',
                                choices:
                                    priorities.asMap().entries.map((entry) {
                                  int i = entry.key;
                                  String label = entry.value;

                                  return Choice(label: label, value: i);
                                }).toList(),
                                onChanged: (Choice priority) {
                                  setState(() {
                                    this.priority = priority.label;
                                    state.didChange(priority.label);
                                  });
                                },
                                errorMessage: state.errorText,
                              );
                            })),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Consumer<TicketProvider>(
                          builder: (_, provider, child) {
                            List<TicketClass> _tickets = provider.tickets;

                            return FormField<String>(
                              initialValue: ticket,
                              builder: (FormFieldState<String> state) {
                                return Column(
                                  children: [
                                    ChipsInput(
                                      label: 'Etiqueta',
                                      addMoreButton: true,
                                      choices: [
                                        for (TicketClass ticket in _tickets)
                                          Choice(
                                            label: ticket.text,
                                            value: ticket.color,
                                          )
                                      ],
                                      onChanged: (ticket) => {
                                        setState(() {
                                          this.ticket = ticket.label;
                                          _color = ticket.value;
                                          state.didChange(ticket.label);
                                        })
                                      },
                                      errorMessage: state.errorText,
                                    ),
                                    TextButton(
                                      onPressed: () => _handleAddTicket(ctx),
                                      child: Text(
                                        'Adicionar Etiqueta',
                                        style: TextStyle(
                                          color: Theme.of(ctx).primaryColor,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: FormField<String>(
                          validator: Validator.validatePresence,
                          builder: (FormFieldState<String> state) {
                            return DatePicker(
                              value: deadline,
                              label: 'Quando ?',
                              hintText: 'Selecione uma data',
                              onChanged: (String deadline) {
                                setState(() {
                                  this.deadline = deadline;
                                  state.didChange(deadline);
                                });
                              },
                              errorText: state.errorText,
                            );
                          },
                        )),
                  ],
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 64, vertical: 14),
              child: PrimaryButton(
                text: 'Salvar',
                onPressed: () => _saveTask(ctx),
              ),
            )
          ],
        ),
        noHeader: true,
      ),
    );
  }

  void _handleChangeInput(void Function() callback) {
    setState(() {
      callback();
    });
  }

  void _saveTask(BuildContext ctx) async {
    if (_formKey.currentState.validate()) {
      Task task = Task(
        text: description,
        deadline: deadline,
        priority: priority,
        color: _color,
        done: false,
        ticket: ticket,
      );
      await Provider.of<TasksProvider>(ctx, listen: false).createTask(task);
      Navigator.of(ctx).pop(true);
    }
  }

  void _handleAddTicket(BuildContext ctx) async {
    Navigator.of(ctx)
        .push(MaterialPageRoute(builder: (_) => CreateTicketPage()));
  }
}
