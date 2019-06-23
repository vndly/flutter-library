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
        title: Text('Intents'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: _onShareLink,
              child: Text('Share link'),
            ),
            RaisedButton(
              onPressed: _onOpenWebPage,
              child: Text('Open webpage'),
            ),
            RaisedButton(
              onPressed: _onSendEmail,
              child: Text('Send email'),
            ),
            RaisedButton(
              onPressed: _onCallNumner,
              child: Text('Call number'),
            ),
            RaisedButton(
              onPressed: _onOpenAddress,
              child: Text('Open address'),
            ),
            RaisedButton(
              onPressed: _onOpenPlayStore,
              child: Text('Open Play Store'),
            ),
            RaisedButton(
              onPressed: _onTakePicture,
              child: Text('Take picture'),
            ),
            RaisedButton(
              onPressed: _onSelectFile,
              child: Text('Select file'),
            ),
          ],
        ),
      ),
    );
  }

  void _onShareLink() {
    Share.share('Check out my website https://example.com');
  }

  void _onOpenWebPage() async {
    _tryLaunch('https://flutter.io');
  }

  void _onSendEmail() async {
    _tryLaunch(
        'mailto:jonh.doe@email.org?subject=The%20subject&body=The%20content');
  }

  void _onCallNumner() async {
    _tryLaunch('tel:+41 79 123 45 67');
  }

  void _onOpenAddress() async {
    //_tryLaunch('geo:46.2050579,6.1265361?q=46.2050579,6.1265361');
    _tryLaunch('geo:0,0?q=Geneva');
  }

  void _onOpenPlayStore() async {
    _tryLaunch('market://details?id=io.flutter.demo.gallery');
  }

  void _onTakePicture() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    OpenFile.open(image.path);
  }

  void _onSelectFile() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    OpenFile.open(image.path);
  }

  void _tryLaunch(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
