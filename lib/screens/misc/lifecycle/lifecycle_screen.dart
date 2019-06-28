import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LifecycleScreen extends StatefulWidget {
  @override
  _LifecycleScreenState createState() => _LifecycleScreenState();
}

class _LifecycleScreenState extends State<LifecycleScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    print('initState()');

    WidgetsBinding.instance.addObserver(this);
    SchedulerBinding.instance
        .addPostFrameCallback((duration) => print('Init state callback'));
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies()');

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(LifecycleScreen oldWidget) {
    print('didUpdateWidget()');

    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate()');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose()');
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    print('didChangeAppLifecycleState() = $state');
  }

  @override
  Widget build(BuildContext context) {
    print('build()');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifecycle'),
      ),
      body: Container(),
    );
  }
}
