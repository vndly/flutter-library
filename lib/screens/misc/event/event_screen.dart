import 'package:flutter/material.dart';
import 'package:event_taxi/event_taxi.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event'),
      ),
      body: Center(
        child: TextCounter(),
      ),
      floatingActionButton: ButtonCounter(),
    );
  }
}

class TextCounter extends StatefulWidget {
  @override
  _TextCounterState createState() => _TextCounterState();
}

class _TextCounterState extends State<TextCounter> {
  DateTime dateTime;

  @override
  initState() {
    super.initState();
    SampleEvent.register((event) => setState(() => dateTime = event.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$dateTime',
    );
  }
}

class ButtonCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => SampleEvent.post(DateTime.now()),
      child: Icon(Icons.add),
    );
  }
}

class SampleEvent implements Event {
  final DateTime dateTime;

  static final bus = EventTaxiImpl();

  SampleEvent(this.dateTime);

  static register(void onData(SampleEvent event)) {
    bus.registerTo<SampleEvent>(true).listen(onData);
  }

  static post(DateTime dateTime) {
    var event = SampleEvent(dateTime);
    bus.fire(event);
  }
}
