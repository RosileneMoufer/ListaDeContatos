import 'package:flutter/material.dart';
import 'package:lista_de_contatos/provider/users.dart';
import 'package:lista_de_contatos/routes/app_routes.dart';
import 'package:lista_de_contatos/views/user_form.dart';
import 'package:lista_de_contatos/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Users>(
      create: (context) => Users(),
      child: MaterialApp(
          title: 'Lista de contatos',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          routes: {
            AppRoutes.HOME: (_) => UserList(),
            AppRoutes.USER_FORM: (_) => UserForm()
          }
      ),
    );
  }
}
