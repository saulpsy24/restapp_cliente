import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp_cliente/provider/provider.dart';
import 'package:restaurapp_cliente/screens/initial.dart';
import 'package:restaurapp_cliente/screens/loginpage.dart';

class RegisterPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: FormBuilder(
            key: _fbKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  attribute: "email",
                  decoration: InputDecoration(labelText: "email"),
                  validators: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email()
                  ],
                ),
                FormBuilderTextField(
                  attribute: "password",
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                  validators: [FormBuilderValidators.minLength(6)],
                ),
                MaterialButton(
                  child: Text("Submit"),
                  onPressed: () {
                    _fbKey.currentState.save();
                    if (_fbKey.currentState.validate()) {
                      print(_fbKey.currentState.value);
                      _register(_fbKey.currentState.value["email"],
                          _fbKey.currentState.value["password"], context);
                    }
                  },
                ),
                MaterialButton(
                  child: Text("Ya tengo cuenta"),
                  onPressed: () {
                    var page = LoginPage();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _register(_email, _password, context) async {
    var provider = Provider.of<MyProvider>(context);
    final FirebaseUser user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _email,
      password: _password,
    )
        .then((user) {
      provider.currentUser = user.uid;

      Navigator.pop(context);
    });
  }
}
