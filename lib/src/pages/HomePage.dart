import 'package:flutter/material.dart';
import 'ContactPage.dart';
import '../models/Contact.dart';

class HomePage extends StatefulWidget {
  final String titleHome;

  HomePage(this.titleHome);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  List<String> listS = List<String>();

  Widget _listItems() {
    if (listS.length > 0) {
      return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: listS.length,
        itemBuilder: (context, i) {
          final name = listS[i];
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(name),
              ),
              Divider()
            ],
          );
        },
      );
    } else {
      return Center(
        child: Text("No hay contactos agregados"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleHome),
      ),
      body: _listItems(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Contact result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return ContactPage();
          }));
          print('El resultado es $result');
          if (result != null) {
            listS.add(result.name);
            setState(() {});
          }
        },
        tooltip: "Agregar Nota",
        child: Icon(Icons.add_comment),
      ),
    );
  }
}
