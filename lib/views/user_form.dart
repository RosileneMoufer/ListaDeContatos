import 'package:flutter/material.dart';
import 'package:lista_de_contatos/models/user.dart';
import 'package:lista_de_contatos/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();

}

class _UserFormState extends State<UserForm> {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      final user = ModalRoute.of(context)!.settings.arguments as User;
      _loadFormData(user);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário de usuário"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final _isValid = _form.currentState!.validate();

              if (_isValid) {
                _form.currentState!.save();
                if (_formData['id'] == null) {
                  _formData['id'] = "null";
                }
                Provider.of<Users>(context, listen: false).put(
                    User(
                      id: _formData['id']!,
                      name: _formData['name']!,
                      email: _formData['email']!,
                      avatarUrl: _formData['avatarUrl']!,
                    )
                );

                Navigator.of(context).pop();
              }
            }
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (name) {
                  if ((name == null) || (name.trim().isEmpty)) {
                    return "erro";
                  }
                },
                onSaved: (name) => _formData['name'] = name!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (email) {
                  if ((email == null) || (email.trim().isEmpty)) {
                    return "erro";
                  }
                  if (email.trim().length < 3) {
                    return "Nome muito pequeno.";
                  }
                },
                onSaved: (email) => _formData['email'] = email!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                validator: (avatar) {
                  if ((avatar == null) || (avatar.trim().isEmpty)) {
                    return "erro";
                  }
                },
                onSaved: (avatar) => _formData['avatarUrl'] = avatar!,
              )
            ],
          )
        )
      )
    );
  }

  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }
}