import 'package:flutter/material.dart';
import 'Contact.dart';

class HomePage extends StatefulWidget {
  final String titleHome;

  HomePage(this.titleHome);

  @override
  _HomePageState createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Widget> _list = [
    ListTile(
      title: Text("Hola"),
    ),
    Divider(),
    ListTile(
      title: Text("Hola"),
    ),
    Divider(),
    ListTile(
      title: Text("Hola"),
    ),
    Divider(),
  ];

  List<String> listS = List<String>();

  Widget _listItems() {
    if (listS.length > 0) {
      return ListView.builder(
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
    //List list = List<Widget>();
    // for (int i = 0; i <= 5; i++) {
    //   final ListTile tile = ListTile(
    //     title: Text('Hola Mundo $i'),
    //   );
    //   _list.add(tile);
    //   if (i < 50) {
    //     _list.add(Divider());
    //   }
    // }

    // return ListView(
    //   children: <Widget>[
    //     Column(
    //       children: <Widget>[
    //         ListTile(
    //           title: Text("Hola"),
    //           subtitle: Text("Subtitulo"),
    //           leading: Icon(Icons.add_location),
    //           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //         ),
    //         Divider()
    //       ],
    //     )
    //   ],
    // );

    // return ListView(
    //   // children: _list.toList(),
    //   children: _list.toList(),
    //   addAutomaticKeepAlives: false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleHome),
      ),
      // body: Builder(
      //   builder: (context) => Center(
      //         // child: RaisedButton(
      //         //   onPressed: () {
      //         //     print("Hola Mundo");
      //         //     final snackBar = SnackBar(
      //         //       content: Text("Hola!"),
      //         //     );
      //         //     Scaffold.of(context).showSnackBar(snackBar);
      //         //   },
      //         //   child: Text("Button"),
      //         // ),
      //         child: _listItems(),
      //       ),
      // ),
      body: _listItems(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // listS.add("Hola Mundo");
          // setState(() {});
          final result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return Contact();
          }));
          print('El resultado es $result');
          if (result != null) {
            listS.add(result);
            setState(() {});
          }
        },
        tooltip: "Agregar Nota",
        child: Icon(Icons.add_comment),
      ),
    );
  }
}
