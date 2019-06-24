import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';

class LottieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: LottieView.fromURL(
              url:
                  'https://assets6.lottiefiles.com/datafiles/n4EPxbSsuHTnM3N/data.json',
              autoPlay: true,
              loop: false,
              onViewCreated: _onViewCreated,
            ),
          ),
        ),
      ),
    );
  }

  void _onViewCreated(LottieController controller) {
    controller.onPlayFinished.listen((bool animationFinished) {
      print('Playback complete. Was Animation Finished? $animationFinished');
    });
  }
}
