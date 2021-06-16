import 'package:flutter/widgets.dart';

class Objective {
  String key;
  String label;
  IconData icon;
  bool isSelected;

  Objective(this.key, this.label, this.icon, {this.isSelected = false});
}

class User {
  String name;
  String email;
  String password;

  User({@required this.email, @required this.name, this.password});
}

class UserProvider {
  User user;
  // ignore: unused_field
  List<Objective> _objectives;

  UserProvider({this.user});

  User setCurrentUser(User user) => this.user = user;

  User getCurrentUser() {
    return user;
  }

  bool saveObjectives(List<Objective> objectives) {
    if (objectives != null && objectives.isNotEmpty) {
      _objectives = objectives;
      return true;
    }
    return false;
  }
}
