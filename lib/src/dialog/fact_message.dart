import 'package:flutter/material.dart';

class FactMessage extends StatelessWidget {
  //const FactMessage({Key key}) : super(key: key);
  FactMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: this.type ? _userMessage(context) : _aliceMessage(context),
        ));
  }

  List<Widget> _aliceMessage(BuildContext context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(
          child: Text('A'),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(this.text),
            )
          ],
        ),
      )
    ];
  }

  List<Widget> _userMessage(BuildContext context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              this.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
                margin: const EdgeInsets.only(top: 5.0), child: Text(this.text))
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          child: Text(this.name[0]),
        ),
      )
    ];
  }
}
