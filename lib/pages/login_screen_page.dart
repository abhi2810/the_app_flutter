import 'package:flutter/material.dart';

class LoginScreenPage extends StatefulWidget {
  LoginScreenPage({Key? key}) : super(key: key);
  @override
  _LoginScreenPageState createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen'),
        ),
        body: _isLoggedIn
            ? Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Logged in as ${_usernameController.text}.',
                        key: Key('loggedInAs'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isLoggedIn = false;
                            });
                          },
                          child: Text('Log out'),
                        ),
                      ),
                    ]))
            : Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      key: Key('username'),
                      controller: _usernameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'Username'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      key: Key('password'),
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_usernameController.text == 'alice' &&
                                _passwordController.text == 'mypassword') {
                              setState(() {
                                _isLoggedIn = true;
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Invalid username or password')));
                            }
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
