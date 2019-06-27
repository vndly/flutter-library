import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/icons/smile.png'),
            SizedBox(
              child: SvgPicture.asset(
                'assets/icons/smile.svg',
              ),
              width: 64,
              height: 64,
            ),
          ],
        ),
      ),
    );
  }
}
