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

class GetDog extends EndPoint<Dog> {
  static const String URL = 'https://dog.ceo/api/breeds/image/random';

  @override
  void execute(void success(Dog dog), void error(Response response)) async {
    try {
      var response = await super.get(URL);
      success(Dog.json(response.body));
    } on Response catch (e) {
      error(e);
    }
  }
}

abstract class EndPoint<T> {
  final _client = http.Client();

  void execute(void success(T result), void error(Response response));

  Future<Response> get(url, {Map<String, String> headers}) async {
    try {
      var response = await _client.get(url, headers: headers);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw response;
      }
    } on Response catch (_) {
      rethrow;
    } catch (e) {
      throw Response('', 500);
    } finally {
      _client.close();
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
