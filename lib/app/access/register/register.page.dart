import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trackejo/providers/login.provider.dart';
import 'package:flutter_trackejo/app/access/register/register.provider.dart';
import 'package:flutter_trackejo/helpers/snackbar.dart';
import 'package:flutter_trackejo/widgets/atm/headings.dart';
import 'package:flutter_trackejo/widgets/mol/primary_button.dart';
import 'package:flutter_trackejo/widgets/views/page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_trackejo/helpers/validator.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _name;
  String _email;
  String _password;
  bool _hidePassword = true;
  LoginProvider loginService;
  final _formKey = GlobalKey<FormState>();

  _RegisterPageState();

  @override
  Widget build(BuildContext ctx) {
    return PageContainer(
      appBarTheme: 'light',
      title: BigText(
        title: 'Criar Conta',
      ),
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
                        labelText: 'Nome',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        isDense: true,
                      ),
                      onChanged: _handleChangeName,
                      validator: Validator.validateName,
                      cursorColor: Theme.of(ctx).primaryColor,
                    )),
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
                text: 'Cadastrar', onPressed: () => _handleRegister(ctx)),
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

  void _handleChangeName(String name) {
    this.setState(() {
      _name = name;
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

  void _handleRegister(BuildContext ctx) async {
    if (_formKey.currentState.validate()) {
      bool registered = await Provider.of<RegisterProvider>(ctx, listen: false)
          .register(_name, _email, _password);
      if (registered == true)
        TCSnackbar.showSnackbar(
            ctx: ctx, text: 'Cadastro realizado com sucesso');
      // Navigator.of(ctx).pop();
    }
  }
}
