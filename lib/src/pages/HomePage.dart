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
    print("initState");
    if (!emptyList) {
      listS..add(Contact(name: "Iron Man", email: "iron@man.com", birthDate: "2019-01-01"))
           ..add(Contact(name: "Goku", email: "goku@dbz.com", birthDate: "2019-02-07"))
            ..add(Contact(name: "Hulk", email: "hulk@marvel.com", birthDate: "2018-11-09"))
            ..add(Contact(name: "Capitan America", email: "cap@marvel.com", birthDate: "1990-10-27"))
            ..add(Contact(name: "Bugs Bunny", email: "bugs@looneytoons.com", birthDate: "2007-12-14"))
            ..add(Contact(name: "Chespirito", email: "chespirito@elchavo.com", birthDate: "1995-04-19"));
    }
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateConfig");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleHome),
      ),
      body: _listItems(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //LLamado usando metodo tradicional sin rutas
          // final Route<Contact> route = MaterialPageRoute(builder: (context) {
          //   return ContactPage();
          // });
          // final Contact result = await Navigator.push(context, route);
          // final Contact result = await Navigator.pushNamed(context, 'contact') as Contact;
          final Contact result = await Navigator.pushNamed(context, 'contact', arguments: Contact(
            name:'Jorge')) as Contact;
          // final result = await Navigator.of(context).pushNamed('contact') as Contact;
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
