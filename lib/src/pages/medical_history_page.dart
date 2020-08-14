import 'package:flutter/material.dart';

class MedicalHistoryPage extends StatefulWidget {
  @override
  _MedicalHistoryPageState createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  List<String> _typesBlood = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  String _typeSelected = 'O+';
  double _weight = 55.00; //Kg
  double _height = 1.60; //m
  List<String> _allergy = List();
  List<String> _baseDisease = new List();
  bool _allergy1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Medical History')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(18.0),
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
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Weight',
          icon: Icon(Icons.person)),
      onChanged: (weight) {
        setState(() {
          _weight = double.parse(weight);
          print(_weight.toString());
        });
      },
    );
  }

  Widget _createHeightInput() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          labelText: 'Height',
          icon: Icon(Icons.person)),
      onChanged: (height) {
        setState(() {
          _height = double.parse(height);
        });
      },
    );
  }

  Widget _createAllergyInput() {
    _allergy.add('');
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              labelText: 'Allergy',
              icon: Icon(Icons.scatter_plot),
              suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 25.0,
                  color: Colors.grey[600],
                  onPressed: () {})),
          onChanged: (allergy) {
            _allergy[0] = allergy;
            print(_allergy[0]);
          },
        ),
      ],
    );
  }

  Widget _createBaseDiseaseInput() {
    _baseDisease.add('');
    return TextFormField(
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
            labelText: 'Base Disease',
            icon: Icon(Icons.scatter_plot),
            suffixIcon: IconButton(
                icon: Icon(Icons.add),
                iconSize: 25.0,
                color: Colors.grey[600],
                onPressed: () {})),
        onChanged: (baseDisease) {
          _baseDisease[0] = baseDisease;
        });
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
                    Navigator.pushNamed(context, 'home');
                  }))
        ],
      ),
    );
  }
}
