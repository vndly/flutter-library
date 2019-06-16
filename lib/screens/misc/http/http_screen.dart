import 'package:flutter/material.dart';
import 'dart:convert' as Json;
import 'package:http/http.dart' as http;

class HttpScreen extends StatefulWidget {
  @override
  _HttpScreenState createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  Status _state = Status.init;
  String _data;

  void _loadContent() async {
    setState(() {
      _state = Status.loading;
    });

    var getDog = GetDog();
    getDog.execute((dog) {
      setState(() {
        _data = dog.url;
        _state = Status.content;
      });
    }, () {
      print('Error');
    });
  }

  Widget _body() {
    switch (_state) {
      case Status.loading:
        return Center(
          child: CircularProgressIndicator(),
        );

      case Status.content:
        return Center(
          child: Image.network(_data),
        );

      default:
        return Center(
          child: RaisedButton(
            child: Text('Load'),
            onPressed: _loadContent,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image'),
        ),
        body: _body());
  }
}

enum Status { init, loading, content }

class GetDog {
  static const String URL = 'https://dog.ceo/api/breeds/image/random';

  void execute(void success(Dog dog), void error()) async {
    var client = http.Client();

    try {
      var response = await client.get(URL);
      var json = Json.jsonDecode(response.body);
      var dog = Dog(json['message']);
      success(dog);
    } catch (e) {
      error();
    } finally {
      client.close();
    }
  }
}

@immutable
class Dog {
  final String url;

  Dog(this.url);
}
