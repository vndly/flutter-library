import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class EncodingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var input = 'http://page.org?foo=the message';

    var base64Encoded = base64.encode(utf8.encode(input));
    var base64Decoded = utf8.decode(base64.decode(base64Encoded));

    var urlEncoded = Uri.encodeFull(input);
    var urlDecoded = Uri.decodeFull(urlEncoded);

    var sha256Hash = sha256.convert(utf8.encode(input));

    return Scaffold(
      appBar: AppBar(
        title: Text('Encoding'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Base 64 Encoded: $base64Encoded',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              'Base 64 Decoded: $base64Decoded',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              'URL Encoded: $urlEncoded',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              'URL Decoded: $urlDecoded',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              'SHA 256: $sha256Hash',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
