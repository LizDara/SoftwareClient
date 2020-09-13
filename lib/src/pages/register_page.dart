import 'package:flutter/material.dart';
import 'package:software_client/src/blocs/provider.dart';
import 'package:software_client/src/models/client_model.dart';
import 'package:software_client/src/providers/client_provider.dart';
import 'package:software_client/src/providers/user_provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _birthday = '';
  bool _gender = true;

  ClientProvider clientProvider = new ClientProvider();
  Client client = new Client();
  UserProvider userProvider = new UserProvider();

  TextEditingController _dateController = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('Register')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _createNameInput(),
              SizedBox(
                height: 15.0,
              ),
              _createLastNameInput(),
              SizedBox(
                height: 15.0,
              ),
              _createBirthInput(context),
              SizedBox(
                height: 15.0,
              ),
              _createGenderInput(),
              SizedBox(
                height: 15.0,
              ),
              _createEmailInput(bloc),
              SizedBox(
                height: 15.0,
              ),
              _createPasswordInput(bloc),
              SizedBox(
                height: 15.0,
              ),
              _createConfirmPasswordInput(bloc),
              SizedBox(
                height: 30.0,
              ),
              _createRegisterButton(bloc)
            ],
          ),
        ),
      ),
    );
  }

  Widget _createNameInput() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Name',
          icon: Icon(Icons.account_circle),
          suffixIcon: Icon(Icons.person_outline)),
      onSaved: (value) => client.name = value,
    );
  }

  Widget _createLastNameInput() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Last Name',
          icon: Icon(Icons.account_circle),
          suffixIcon: Icon(Icons.person_outline)),
      onSaved: (value) => client.lastName = value,
    );
  }

  Widget _createBirthInput(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _dateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Birthday',
          icon: Icon(Icons.calendar_today),
          suffixIcon: Icon(Icons.perm_contact_calendar)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime now = new DateTime.now();
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime(now.year - 11),
        firstDate: new DateTime(now.year - 80),
        lastDate: new DateTime(now.year - 10));
    if (picked != null) {
      _birthday = picked.toString();
      _dateController.text = _birthday;
      client.birth = picked;
    }
  }

  Widget _createGenderInput() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.wc,
          color: Colors.grey[600],
        ),
        SizedBox(
          width: 20.0,
        ),
        Checkbox(
            value: _gender,
            onChanged: (male) {
              setState(() {
                _gender = male;
                client.gender = true;
              });
            }),
        Text('Male'),
        SizedBox(width: 40.0),
        Checkbox(
          value: !_gender,
          onChanged: (male) {
            setState(() {
              _gender = !male;
              client.gender = false;
            });
          },
        ),
        Text('Female')
      ],
    );
  }

  Widget _createEmailInput(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              labelText: 'Email',
              icon: Icon(Icons.email),
              suffixIcon: Icon(Icons.alternate_email)),
          onChanged: bloc.emailSink,
        );
      },
    );
  }

  Widget _createPasswordInput(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              labelText: 'Password',
              icon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.lock_outline),
              errorText: snapshot.error),
          onChanged: bloc.passwordSink,
        );
      },
    );
  }

  Widget _createConfirmPasswordInput(LoginBloc bloc) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Confirm Password',
          icon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.lock_outline)),
    );
  }

  Widget _createRegisterButton(LoginBloc bloc) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: <Widget>[
          Text(
            'Register',
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
                    if (!formKey.currentState.validate()) return;
                    formKey.currentState.save();
                    _register(context, bloc);
                  }))
        ],
      ),
    );
  }

  _register(BuildContext context, LoginBloc bloc) async {
    final result = await userProvider.createUser(bloc.email, bloc.password);
    clientProvider.createClient(client);
    if (result['ok']) {
      Navigator.pushReplacementNamed(context, 'medicalHistory');
    } else {
      showMessage('Error');
    }
  }

  void showMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
