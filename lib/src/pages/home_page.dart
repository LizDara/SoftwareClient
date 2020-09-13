import 'package:flutter/material.dart';
import 'package:software_client/src/preferences/user_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _preferences = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _preferences.clearPreferences();
              Navigator.pushReplacementNamed(context, 'login');
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _createFirstItem(),
          SizedBox(
            height: 20.0,
          ),
          _createSecondItem(),
          SizedBox(
            height: 20.0,
          ),
          _createThirdItem(),
        ],
      ),
      floatingActionButton: _createDialogButton(),
    );
  }

  Widget _createFirstItem() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://images.vexels.com/media/users/3/191927/raw/f0965b3474f73e5eb1d15049e03fd313-plantilla-de-infografia-de-sintomas-covid-19.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Sintomas del Coronavirus'))
        ],
      ),
    );
  }

  Widget _createSecondItem() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://images.vexels.com/media/users/3/191927/raw/f0965b3474f73e5eb1d15049e03fd313-plantilla-de-infografia-de-sintomas-covid-19.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Prevención del Coronavirus'))
        ],
      ),
    );
  }

  Widget _createThirdItem() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://images.vexels.com/media/users/3/191927/raw/f0965b3474f73e5eb1d15049e03fd313-plantilla-de-infografia-de-sintomas-covid-19.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Secuelas del Coronavirus'))
        ],
      ),
    );
  }

  Widget _createDialogButton() {
    return FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          Navigator.pushNamed(context, 'dialog');
        });
  }
}
