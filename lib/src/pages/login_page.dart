import 'package:flutter/material.dart';
import 'package:software_client/src/blocs/provider.dart';
import 'package:software_client/src/providers/user_provider.dart';

class LoginPage extends StatelessWidget {
  final UserProvider userProvider = new UserProvider();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('Login')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(
                height: 5.0,
              ),
              _createLogo(),
              Divider(
                height: 5.0,
              ),
              _createEmailInput(bloc),
              Divider(),
              _createPasswordInput(bloc),
              Divider(height: 20.0),
              _createSignInButton(bloc),
              Divider(height: 40.0),
              _createSignUpButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _createLogo() {
    return FlutterLogo(
      size: 200.0,
    );
  }

  Widget _createEmailInput(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'Email', suffixIcon: Icon(Icons.alternate_email)),
            onChanged: bloc.emailSink,
          );
        });
  }

  Widget _createPasswordInput(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Password', suffixIcon: Icon(Icons.lock_outline)),
            onChanged: bloc.passwordSink,
          );
        });
  }

  Widget _createSignInButton(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                        onPressed: snapshot.hasData
                            ? () {
                                _login(context, bloc);
                              }
                            : null))
              ],
            ),
          );
        });
  }

  _login(BuildContext context, LoginBloc bloc) async {
    Map result = await userProvider.login(bloc.email, bloc.password);
    if (result['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      showMessage('Email or password incorrect');
    }
  }

  Widget _createSignUpButton(BuildContext context) {
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

  void showMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
