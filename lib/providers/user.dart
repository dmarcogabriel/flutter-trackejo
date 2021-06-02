import 'package:flutter/widgets.dart';

class Objective {
  String key;
  String label;
  IconData icon;
  bool isSelected;

  Objective(this.key, this.label, this.icon, {this.isSelected = false});
}

class User {
  List<Objective> objectives;
  String name;
  String email;

  User({this.objectives, this.email, this.name});
}

class UserProvider {
  User user;

  UserProvider()
      : user = User(
            email: 'victoria.robertson@gmail.com', name: 'Victoria Robertson');

  User getCurrentUser() {
    return user;
  }

  bool saveObjectives(List<Objective> objectives) {
    if (objectives != null && objectives.isNotEmpty) {
      user.objectives = objectives;
      return true;
    }
    return false;
  }
}
