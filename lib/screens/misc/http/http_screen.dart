import 'dart:convert';
import 'package:dahttp/dahttp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HttpScreen extends StatefulWidget {
  @override
  _HttpScreenState createState() => _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen> {
  Status _state = Status.init;
  String _data;
  String _error;

  void _loadContent() async {
    setState(() {
      _state = Status.loading;
    });

    var getDog = GetDog();
    var result = await getDog.call();

    if (result.isSuccessful) {
      setState(() {
        _data = result.value.url;
        _state = Status.content;
      });
    } else {
      setState(() {
        _error = result.isUnsuccessful
            ? result.response.reasonPhrase
            : result.exception.toString();
        _state = Status.error;
      });
    }
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
          child: Text('$_error'),
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

class GetDog extends ValueHttp<Dog> {
  static const String URL = 'https://dog.ceo/api/breeds/image/random';

  Future<HttpResult<Dog>> call() {
    return super.get(URL);
  }

  @override
  Dog convert(Response response) {
    return Dog.json(response.body);
  }
}

@immutable
class Dog {
  final String url;

  Dog(this.url);

  static Dog json(String json) {
    var data = jsonDecode(json);

    return Dog(data['message']);
  }
}
