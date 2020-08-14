import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _name = '';
  String _lastName = '';
  String _birthday = '';
  bool _gender = true;
  String _username = '';
  String _email = '';
  String _password = '';
  TextEditingController _dateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18.0),
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
            _createBirthdayInput(context),
            SizedBox(
              height: 15.0,
            ),
            _createGenderInput(),
            SizedBox(
              height: 15.0,
            ),
            _createUsernameInput(),
            SizedBox(
              height: 15.0,
            ),
            _createEmailInput(),
            SizedBox(
              height: 15.0,
            ),
            _createPasswordInput(),
            SizedBox(
              height: 15.0,
            ),
            _createConfirmPasswordInput(),
            SizedBox(
              height: 30.0,
            ),
            _createRegisterButton()
          ],
        ),
      ),
    );
  }

  Widget _createNameInput() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Name',
          icon: Icon(Icons.account_circle),
          suffixIcon: Icon(Icons.person_outline)),
      onChanged: (name) {
        setState(() {
          _name = name;
        });
      },
    );
  }

  Widget _createLastNameInput() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Last Name',
          icon: Icon(Icons.account_circle),
          suffixIcon: Icon(Icons.person_outline)),
      onChanged: (lastName) {
        setState(() {
          _lastName = lastName;
        });
      },
    );
  }

  Widget _createBirthdayInput(BuildContext context) {
    return TextField(
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
              });
            }),
        Text('Male'),
        SizedBox(width: 40.0),
        Checkbox(
          value: !_gender,
          onChanged: (male) {
            setState(() {
              _gender = !male;
            });
          },
        ),
        Text('Female')
      ],
    );
  }

  Widget _createUsernameInput() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Username',
          icon: Icon(Icons.account_circle),
          suffixIcon: Icon(Icons.person)),
      onChanged: (username) {
        setState(() {
          _username = username;
        });
      },
    );
  }

  Widget _createEmailInput() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Email',
          icon: Icon(Icons.email),
          suffixIcon: Icon(Icons.alternate_email)),
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Password',
          icon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.lock_outline)),
      onChanged: (password) {
        setState(() {
          _password = password;
        });
      },
    );
  }

  Widget _createConfirmPasswordInput() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Confirm Password',
          icon: Icon(Icons.lock),
          suffixIcon: Icon(Icons.lock_outline)),
      onChanged: (confirmPassword) {
        setState(() {});
      },
    );
  }

  Widget _createRegisterButton() {
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
                    Navigator.pushNamed(context, 'medicalHistory');
                  }))
        ],
      ),
    );
  }
}
