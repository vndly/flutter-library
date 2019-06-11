import 'package:flutter/material.dart';

class DialogScreen extends StatelessWidget {
  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => createDialog(context),
    );
  }

  Widget createDialog(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.network(
          'https://images.dog.ceo/breeds/borzoi/n02090622_1726.jpg',
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Dog name',
                style: theme.textTheme.display1,
              ),
              Text(
                'Dog description',
                style: theme.textTheme.subhead.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Dog text',
                style: theme.textTheme.body1,
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: [
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    RaisedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Accept'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => openDialog(context),
          child: Text('Show dialog'),
        ),
      ),
    );
  }
}
