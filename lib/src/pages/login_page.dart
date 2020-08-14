import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(
                height: 30.0,
              ),
              _createLogo(),
              Divider(
                height: 20.0,
              ),
              _createEmailInput(),
              Divider(),
              _createPasswordInput(),
              Divider(height: 40.0),
              _createSignInButton(),
              Divider(height: 80.0),
              _createSignUpButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _createLogo() {
    return FlutterLogo(
      size: 280.0,
    );
  }

  Widget _createEmailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email', suffixIcon: Icon(Icons.alternate_email)),
      onChanged: (email) {
        setState(() {
          _email = email;
        });
      },
    );
  }

  Widget _createPasswordInput() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password', suffixIcon: Icon(Icons.lock_outline)),
      onChanged: (password) {
        setState(() {
          _password = password;
        });
      },
    );
  }

  Widget _createSignInButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Text(
            'Sign in',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Expanded(child: SizedBox()),
          Ink(
              decoration: const ShapeDecoration(
                  color: Colors.blue, shape: CircleBorder()),
              child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.white,
                  iconSize: 20.0,
                  padding: EdgeInsets.all(25.0),
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  }))
        ],
      ),
    );
  }

  Widget _createSignUpButton() {
    return Row(
      children: <Widget>[
        FlatButton(
            child: Text('Sign Up',
                style: TextStyle(
                    fontSize: 16.0, decoration: TextDecoration.underline)),
            onPressed: () {
              Navigator.pushNamed(context, 'register');
            }),
        Expanded(child: SizedBox()),
        FlatButton(
            child: Text('Forgot Password',
                style: TextStyle(
                    fontSize: 16.0, decoration: TextDecoration.underline)),
            onPressed: () {
              print('forgot Password');
            })
      ],
    );
  }
}
