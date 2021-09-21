import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_contatos/components/user_tile.dart';
import 'package:lista_de_contatos/provider/users.dart';
import 'package:lista_de_contatos/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de contatos"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, index) => UserTile(users.byIndex(index)),
      ),
    );
  }

}