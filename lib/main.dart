import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mycontacts_demo/src/pages/ContactPage.dart';

import 'src/pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en','US'),
        const Locale('es','EN')
      ],
      theme: ThemeData(
        primarySwatch: Colors.red,
        // primaryColor: Colors.yellow
      ),
      // home: HelloWorld(),
      initialRoute: '/',
      routes: <String,WidgetBuilder>{
        '/': ( BuildContext context ) {
          return HomePage("Mis Notas");
        },
        'contact' : ( BuildContext context ) => ContactPage()
      }
    );
  }
}

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Welcome Flutter")
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            print("Hola!");
          },
          child: Text("Tap Me")
        )
      )
    );
  }
}