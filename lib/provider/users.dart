import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:lista_de_contatos/data/users.dart';
import 'package:lista_de_contatos/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...USERS};

  List<User> get allUsers {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(User user) {
    // update user
    if ((user.id.trim().isNotEmpty) && (_items.containsKey(user.id))) {
      _items.update(user.id, (_) => User(
        id: user.id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl,
      ));
    }

    // add new user
    String id = Random().nextDouble().toString();
    _items.putIfAbsent(id, () => User(
      id: id,
      name: user.name,
      email: user.email,
      avatarUrl: user.avatarUrl,
    ));

    notifyListeners();
  }

  void remove(User user) {
    _items.remove(user.id);

    notifyListeners();
  }
}