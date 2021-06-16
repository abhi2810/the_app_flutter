import 'package:flutter/material.dart';

class EchoBoxPage extends StatefulWidget {
  EchoBoxPage({Key? key}) : super(key: key);
  @override
  _EchoBoxPageState createState() => _EchoBoxPageState();
}

class _EchoBoxPageState extends State<EchoBoxPage> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Echo Box'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_text != '') Text('Here\'s what you said:'),
              if (_text != '')
                Text(
                  _text,
                  key: Key('value'),
                ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _textController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _text = _textController.text;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Saving Data')));
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              )
            ]));
  }
}
