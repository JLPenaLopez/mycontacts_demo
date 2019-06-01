import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Contact.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() {
    return _ContactPageState();
  }
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _txtNameController = TextEditingController();
  final TextEditingController _txtEmailController = TextEditingController();
  final TextEditingController _txtBirthDateController = TextEditingController();

  String _name;
  String _email;
  String _birthDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name = '';
    _email = '';
    _birthDate = '';
  }

  @override
  void dispose() {
    super.dispose();
    _txtNameController.dispose();
    _txtEmailController.dispose();
    _txtBirthDateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacto"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                TextField(
                    controller: _txtNameController,
                    keyboardType: TextInputType.text,
                    maxLength: 30,
                    decoration: InputDecoration(
                        hintText: 'Nombre de contacto',
                        labelText: 'Nombre',
                        helperText: 'Solo el nombre',
                        icon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    onChanged: (value) {
                      setState(() {
                        _name = value;
                      });
                    }),
                Divider(
                  height: 10,
                  color: Colors.transparent,
                ),
                TextField(
                  controller: _txtEmailController,
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 40,
                    decoration: InputDecoration(
                        hintText: 'Email de contacto',
                        labelText: 'Email',
                        helperText: 'Solo el email',
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    }),
                Divider(
                  height: 10,
                  color: Colors.transparent,
                ),
                TextField(
                  enableInteractiveSelection: false,
                  controller: _txtBirthDateController,
                  maxLength: 40,
                  decoration: InputDecoration(
                      hintText: 'Selecciona tu fecha de nacimiento',
                      labelText: 'Fecha de nacimiento',
                      helperText: 'Toca para seleccionar la fecha',
                      icon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    _selectDate(context);
                  },
                )
              ],
            ),
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5, right: 10, bottom: 10, left: 10),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  elevation: 100,
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Agregar'),
                  onPressed: () {
                    _onPresBtnAccept(context);
                  },
                ),
              ))
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2400),
        initialDate: DateTime.now(),
        locale: Locale('es', 'ES'));

    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    print(dateFormat.format(picked));
    if (picked != null) {
      setState(() {
        _birthDate = dateFormat.format(picked);
        _txtBirthDateController.text = _birthDate;
      });
    }
  }

  void _onPresBtnAccept(BuildContext context) {
    bool isValid = true;
    String message = 'Para crear un contacto son necesarios los siguientes datos:\n\n';

    if (_txtNameController.text.isEmpty) {
      isValid = false;
      message += '- Nombre\n';
    }

    if (_txtEmailController.text.isEmpty) {
      isValid = false;
      message += '- Email\n';
    }

    if (_txtBirthDateController.text.isEmpty) {
      isValid = false;
      message += '- Fecha de nacimiento\n';
    }

    if (!isValid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
          );
        }
      );
      return;
    }

    Contact contact = Contact(
      name: _txtNameController.text,
      email: _txtEmailController.text,
      birthDate: _txtBirthDateController.text
    );

    Navigator.pop(context, contact);
  }
}
