import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacto"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Agregar"),
          onPressed: () {
            Navigator.pop(context, 'Resultado');
          },
        ),
      ),
    );
  }
}