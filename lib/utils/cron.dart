import 'dart:async';

class Cron {
  static void runTask() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      print('Timer triggered');
      timer.cancel();
    });
  }
}