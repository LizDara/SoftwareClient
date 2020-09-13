import 'package:flutter/material.dart';
import 'package:software_client/src/models/information_model.dart';
import 'package:software_client/src/providers/information_provider.dart';

class MedicalHistoryPage extends StatefulWidget {
  @override
  _MedicalHistoryPageState createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  List<String> _typesBlood = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  String _typeSelected = 'O+';
  double _weight = 55.00; //Kg
  double _height = 1.60; //m

  InformationProvider informationProvider = new InformationProvider();
  Information information = new Information();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Medical History')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(18.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _createBloodTypeInput(),
                SizedBox(height: 15.0),
                _createWeightInput(),
                SizedBox(height: 15.0),
                _createHeightInput(),
                SizedBox(height: 15.0),
                _createAllergyInput(),
                SizedBox(height: 15.0),
                _createBaseDiseaseInput(),
                SizedBox(height: 30.0),
                _createSaveButton()
              ],
            ),
          ),
        ));
  }

  Widget _createBloodTypeInput() {
    return Row(
      children: <Widget>[
        Icon(Icons.bubble_chart, color: Colors.grey[600]),
        SizedBox(width: 20.0),
        DropdownButton(
          value: _typeSelected,
          items: _getOptions(),
          onChanged: (option) {
            setState(() {
              _typeSelected = option;
              information.bloodType = option;
            });
          },
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _getOptions() {
    List<DropdownMenuItem<String>> items = new List();
    _typesBlood.forEach((element) {
      items.add(
          DropdownMenuItem(child: Text(element + '      '), value: element));
    });
    return items;
  }

  Widget _createWeightInput() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Weight',
          icon: Icon(Icons.person)),
      onSaved: (value) => information.weight = double.parse(value),
    );
  }

  Widget _createHeightInput() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Height',
          icon: Icon(Icons.person)),
      onSaved: (value) => information.height = double.parse(value),
    );
  }

  Widget _createAllergyInput() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Allergy',
          icon: Icon(Icons.scatter_plot)),
      onSaved: (value) => information.allergy = value,
    );
  }

  Widget _createBaseDiseaseInput() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Disease',
          icon: Icon(Icons.scatter_plot)),
      onSaved: (value) => information.disease = value,
    );
  }

  Widget _createSaveButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: <Widget>[
          Text(
            'Save',
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
                    _save(context);
                  }))
        ],
      ),
    );
  }

  _save(BuildContext context) {
    informationProvider.createInformation(information);
    Navigator.pushReplacementNamed(context, 'home');
  }
}
