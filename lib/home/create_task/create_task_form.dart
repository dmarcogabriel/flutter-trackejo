import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';
import 'package:flutter_trackejo/widgets/mol/primary_button.dart';
import 'package:flutter_trackejo/widgets/org/forms/forms_generator.dart';
import 'package:flutter_trackejo/widgets/org/forms/inputs/chips.dart';
import 'package:flutter_trackejo/widgets/org/forms/inputs/datepicker.dart';
import 'package:flutter_trackejo/widgets/org/forms/inputs/text_input.dart';
import 'package:flutter_trackejo/widgets/page.dart';
import 'package:provider/provider.dart';

class CreateTaskForm extends StatefulWidget {
  @override
  _CreateTaskFormState createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  String description;
  Choice priority;
  Choice ticket;
  String deadline;
  List<String> priorities;
  List<String> tickets;

  _CreateTaskFormState() {
    priorities = ['Baixa', 'Média', 'Alta'];
    tickets = [
      'Pessoal',
      'Treino',
      'Faculdade',
      'Família',
      'Livros',
      'Carro',
      'Lazer'
    ];
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
            FormsGenerator(inputs: [
              TextInput(
                  input: Input(
                      label: 'O que precisa fazer?',
                      hintText: 'ex: Correr na pista...',
                      onChanged: (description) => _handleChangeInput(
                          () => this.description = description))),
              ChipsInput(
                  label: 'Prioridade',
                  choices: priorities.asMap().entries.map((entry) {
                    int i = entry.key;
                    String label = entry.value;

                    return Choice(label: label, value: i);
                  }).toList(),
                  onChanged: (priority) =>
                      _handleChangeInput(() => this.priority = priority)),
              ChipsInput(
                  label: 'Etiquetas',
                  addMoreButton: true,
                  choices: tickets.asMap().entries.map((entry) {
                    int i = entry.key;
                    String label = entry.value;

                    return Choice(label: label, value: i);
                  }).toList(),
                  onChanged: (ticket) =>
                      _handleChangeInput(() => this.ticket = ticket)),
              DatePicker(
                  value: deadline,
                  onChanged: (deadline) => _handleChangeInput(() {
                        this.deadline = deadline;
                      }),
                  input: DatePickerInput(
                    label: 'Quando ?',
                    hintText: 'Selecione uma data',
                  )),
            ]),
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

  void _handleChangeInput(void Function() callback) => this.setState(() {
        callback();
      });

  void _saveTask(BuildContext ctx) {
    // todo: add validator
    TasksProvider tasksProvider =
        Provider.of<TasksProvider>(ctx, listen: false);
    Task task = Task(
        text: description,
        deadline: deadline,
        priority: priority,
        color: 'Black',
        done: false,
        ticket: ticket);
    tasksProvider.createTask(task);
    Navigator.pop(ctx, true);
  }
}
