import 'package:flutter/material.dart';
import 'package:flutter_library/resources/environments.dart';
import 'package:flutter_library/resources/locator.dart';

class ChangeEnvironment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          const EdgeInsets.only(top: 15, left: 15, bottom: 5, right: 0),
      title: const Text('Select environment'),
      titlePadding: const EdgeInsets.only(left: 20, top: 20),
      content: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    final List<Widget> children = [];

    children.add(ListView(
      shrinkWrap: true,
      children: [
        _environment(context, DevEnvironment()),
        _environment(context, ProdEnvironment()),
      ],
    ));

    children.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
  }

  Widget _environment(BuildContext context, Environment environment) {
    return ListTile(
      title: Text(environment.name),
      onTap: () {
        Navigator.of(context).pop();
        _onSelected(environment);
      },
    );
  }

  void _onSelected(Environment environment) {
    if (environment.name == 'dev') {
      setupLocatorDev();
    } else if (environment.name == 'prod') {
      setupLocatorProd();
    }
  }
}
