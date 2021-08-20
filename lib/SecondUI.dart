import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:app_redsag/main.dart';
class SecondUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Redux List"),
    ),
    body: Center(
    child: Column(
    children: <Widget>[
      ViewQues(),
    ],
    ),
    ),
    );
  }
}
class ViewQues extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StoreConnector<dynamic, String>(
      converter: (store) => store.state.toString(),
      builder: (context, count) {
        return new Text(
          count,
          style: Theme.of(context).textTheme.headline,
        );
      },
    );}}