import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContadorPageState();
  }
}

class _ContadorPageState extends State<ContadorPage> {
  final TextStyle _myStyle = new TextStyle(fontSize: 25);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Title'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                'Numero de taps:',
                style: _myStyle,
              ),
              Text(
                '$_conteo',
                style: _myStyle,
              )
            ])),
        floatingActionButton: _crearBotones());
  }

  Widget _crearBotones() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
            onPressed: _reset, child: Icon(Icons.exposure_zero)),
        Expanded(child: SizedBox()),
        FloatingActionButton(onPressed: _sustraer, child: Icon(Icons.remove)),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(onPressed: _agregar, child: Icon(Icons.add))
      ],
    );
  }

  void _agregar() {
    setState(() {
      _conteo++;
    });
  }

  void _sustraer() {
    setState(() {
      _conteo--;
    });
  }

  void _reset() {
    setState(() {
      _conteo = 0;
    });
  }
}
