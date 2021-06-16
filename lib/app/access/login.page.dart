import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/providers/login.provider.dart';
import 'package:flutter_trackejo/providers/user.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';
import 'package:flutter_trackejo/widgets/mol/primary_button.dart';
import 'package:flutter_trackejo/widgets/views/page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_trackejo/helpers/validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  bool _hidePassword = true;
  LoginProvider loginService;
  final _formKey = GlobalKey<FormState>();

  _LoginPageState();

  @override
  Widget build(BuildContext ctx) {
    return PageContainer(
      appBarTheme: 'light',
      title: BigText(
        title: 'Entrar',
      ),
      appBarActions: [
        TextButton(
          onPressed: () => _handleRegister(ctx),
          child: Text(
            'Cadastrar',
            style: TextStyle(color: Theme.of(ctx).primaryColor),
          ),
        )
      ],
      child: Column(
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
                        labelText: 'Email',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        isDense: true,
                      ),
                      onChanged: _handleChangeEmail,
                      validator: Validator.validateEmail,
                      cursorColor: Theme.of(ctx).primaryColor,
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 7),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                        labelText: 'Senha',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: EdgeInsets.only(bottom: 7, left: 14),
                        suffix: TextButton(
                          child: Text(_hidePassword ? 'Mostrar' : 'Esconder',
                              style: TextStyle(
                                  color: Theme.of(ctx).primaryColor,
                                  fontSize: 12)),
                          onPressed: _handlePasswordVisibility,
                        ),
                        isDense: true,
                      ),
                      cursorColor: Theme.of(ctx).primaryColor,
                      obscureText: _hidePassword,
                      onChanged: _handleChangePassword,
                      validator: Validator.validatePassword,
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 64),
            child: PrimaryButton(
                text: 'Entrar', onPressed: () => _handleLogin(ctx)),
          )
        ],
      ),
    );
  }

  void _handlePasswordVisibility() {
    this.setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  void _handleChangeEmail(String email) {
    this.setState(() {
      _email = email;
    });
  }

  void _handleChangePassword(String password) {
    this.setState(() {
      _password = password;
    });
  }

  void _handleLogin(BuildContext ctx) async {
    if (_formKey.currentState.validate()) {
      User user = await Provider.of<LoginProvider>(ctx, listen: false)
          .login(_email, _password);
      Provider.of<UserProvider>(ctx, listen: false).setCurrentUser(user);
      Navigator.of(ctx).pop('refresh');
    }
  }

  void _handleRegister(BuildContext ctx) async {
    Navigator.of(ctx).pushNamed('/register');
  }
}
