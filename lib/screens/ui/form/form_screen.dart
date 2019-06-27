import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey();

  void _onSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(50),
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value.isEmpty ? 'Invalid name' : null,
                onSaved: (value) {},
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
                validator: (value) => value.isEmpty ? 'Invalid age' : null,
                onSaved: (value) {},
              ),
              RaisedButton(
                child: const Text('Submit'),
                onPressed: _onSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
