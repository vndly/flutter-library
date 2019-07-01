import 'package:flutter/material.dart';
import 'package:flutter_library/resources/environments.dart';
import 'package:flutter_library/resources/locator.dart';
import 'package:flutter_library/screens/app/change_environment.dart';
import 'package:get_version/get_version.dart';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';

class AppConfig extends StatefulWidget {
  @override
  _AppConfigState createState() => _AppConfigState();
}

class _AppConfigState extends State<AppConfig> {
  String projectVersion = '';
  String projectCode = '';
  String projectName = '';
  AndroidDeviceInfo info;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future initPlatformState() async {
    try {
      projectVersion = await GetVersion.projectVersion;
    } on PlatformException {
      projectVersion = 'Failed to get project version.';
    }

    try {
      projectCode = await GetVersion.projectCode;
    } on PlatformException {
      projectCode = 'Failed to get build number.';
    }

    try {
      projectName = await GetVersion.appName;
    } on PlatformException {
      projectName = 'Failed to get app name.';
    }

    final DeviceInfoPlugin plugin = DeviceInfoPlugin();
    info = await plugin.androidInfo;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          const EdgeInsets.only(top: 15, left: 15, bottom: 5, right: 0),
      title: const Text('App config'),
      titlePadding: const EdgeInsets.only(left: 20, top: 20),
      content: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    final environment = getIt<Environment>();

    final List<Widget> children = [
      _entry('Environment:', environment.name),
      _entry('Version name:', projectVersion),
      _entry('Version code:', projectCode),
    ];

    if (info != null) {
      children.addAll([
        _entry('Manufacturer:', '${info.manufacturer}'),
        _entry('Model:', '${info.model}'),
        _entry('Android version:', '${info.version.release}'),
        _entry('Android SDK:', '${info.version.sdkInt}'),
      ]);
    }

    children.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            child: const Text('CHANGE'),
            onPressed: () {
              Navigator.of(context).pop();
              _onChange(context);
            },
          ),
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

  Widget _entry(String key, String value) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Text(
            key,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }

  void _onChange(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ChangeEnvironment(),
    );
  }
}
