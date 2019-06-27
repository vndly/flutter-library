import 'package:open_file/open_file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IntentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intents'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: _onShareLink,
              child: const Text('Share link'),
            ),
            RaisedButton(
              onPressed: _onOpenWebPage,
              child: const Text('Open webpage'),
            ),
            RaisedButton(
              onPressed: _onSendEmail,
              child: const Text('Send email'),
            ),
            RaisedButton(
              onPressed: _onCallNumner,
              child: const Text('Call number'),
            ),
            RaisedButton(
              onPressed: _onOpenAddress,
              child: const Text('Open address'),
            ),
            RaisedButton(
              onPressed: _onOpenPlayStore,
              child: const Text('Open Play Store'),
            ),
            RaisedButton(
              onPressed: _onTakePicture,
              child: const Text('Take picture'),
            ),
            RaisedButton(
              onPressed: _onSelectFile,
              child: const Text('Select file'),
            ),
          ],
        ),
      ),
    );
  }

  void _onShareLink() {
    Share.share('Check out my website https://example.com');
  }

  Future _onOpenWebPage() async {
    _tryLaunch('https://flutter.io');
  }

  Future _onSendEmail() async {
    _tryLaunch(
        'mailto:jonh.doe@email.org?subject=The%20subject&body=The%20content');
  }

  Future _onCallNumner() async {
    _tryLaunch('tel:+41 79 123 45 67');
  }

  Future _onOpenAddress() async {
    //_tryLaunch('geo:46.2050579,6.1265361?q=46.2050579,6.1265361');
    _tryLaunch('geo:0,0?q=Geneva');
  }

  Future _onOpenPlayStore() async {
    _tryLaunch('market://details?id=io.flutter.demo.gallery');
  }

  Future _onTakePicture() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    OpenFile.open(image.path);
  }

  Future _onSelectFile() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    OpenFile.open(image.path);
  }

  Future _tryLaunch(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
