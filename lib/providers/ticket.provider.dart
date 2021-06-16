import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_trackejo/providers/tasks.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class TicketClass {
  int color;
  String text;
  List<Task> tasks;

  TicketClass({
    @required this.text,
    @required this.color,
    this.tasks,
  });
}

List<String> defaultTickets = [
  'Pessoal',
  'Treino',
  'Faculdade',
  'Família',
  'Livros',
  'Carro',
  'Lazer'
];

class TicketProvider with ChangeNotifier {
  List<TicketClass> _tickets = defaultTickets.map((ticket) {
    return TicketClass(text: ticket, color: 0xff000000);
  }).toList();

  List<TicketClass> get tickets => [..._tickets];

  void createTicket(TicketClass ticket) {
    _tickets.add(ticket);
    notifyListeners();
  }

  TicketClass _ticketParse(String jsonTask) {
    dynamic task = jsonDecode(jsonTask);
    return TicketClass(
      text: task['text'],
      color: task['color'],
    );
  }

  String _ticketStringify(TicketClass task) {
    return jsonEncode({
      'text': task.text,
      'color': task.color,
    });
  }
}
