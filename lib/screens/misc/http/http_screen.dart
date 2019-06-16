import 'package:flutter/material.dart';
import 'dart:convert' as Json;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpScreen extends StatefulWidget {
  @override
  _HttpScreenState createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  Status _state = Status.init;
  String _data;
  Response _error;

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
    }, (response) {
      setState(() {
        _error = response;
        _state = Status.error;
      });
    });
  }

  Widget _body() {
    switch (_state) {
      case Status.init:
        return Center(
          child: RaisedButton(
            child: Text('Load'),
            onPressed: _loadContent,
          ),
        );

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
          child: Text('${_error.statusCode} ${_error.reasonPhrase}'),
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

enum Status { init, loading, content, error }

class GetDog {
  static const String URL = 'https://dog.ceo/api/breeds/image/random';

  void execute(void success(Dog dog), void error(Response response)) async {
    var client = http.Client();

    try {
      var response = await client.get(URL);

      if (response.statusCode == 200) {
        success(Dog.json(response.body));
      } else {
        error(response);
      }
    } catch (e) {
      error(Response(null, 500));
    } finally {
      client.close();
    }
  }
}

@immutable
class Dog {
  final String url;

  Dog(this.url);

  static Dog json(String json) {
    var data = Json.jsonDecode(json);

    return Dog(data['message']);
  }
}
