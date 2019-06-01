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
  List<Contact> listS = List<Contact>();
  bool emptyList = false;

  @override
  void initState() {
    super.initState();
    if (!emptyList) {
      listS.add(Contact(name: "Iron Man", email: "iron@man.com", birthDate: "2019-01-01"));
      listS.add(Contact(name: "Goku", email: "goku@dbz.com", birthDate: "2019-02-07"));
      listS.add(Contact(name: "Hulk", email: "hulk@marvel.com", birthDate: "2018-11-09"));
      listS.add(Contact(name: "Capitan America", email: "cap@marvel.com", birthDate: "1990-10-27"));
      listS.add(Contact(name: "Bugs Bunny", email: "bugs@looneytoons.com", birthDate: "2007-12-14"));
      listS.add(Contact(name: "Chespirito", email: "chespirito@elchavo.com", birthDate: "1995-04-19"));
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
            listS.add(result);
            setState(() {});
          }
        },
        tooltip: "Agregar Nota",
        child: Icon(Icons.person_add),
      ),
    );
  }

  Widget _listItems() {
    if (listS.length > 0) {
      return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: listS.length,
        itemBuilder: (context, i) {
          final contact = listS[i];
          final indexImage = i + 1;
          return Column(
            children: <Widget>[
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    'https://picsum.photos/50?image=$indexImage',
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(contact.name),
                    Text(contact.birthDate)
                  ],
                ),
                subtitle: Text(contact.email),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(contact.name),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(125),
                                child: Image.network(
                                  'https://picsum.photos/250?image=$indexImage',
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
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
}
