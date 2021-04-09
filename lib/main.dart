import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primarySwatch: Colors.brown,
      ),
      home: Scaffold (
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("Resto Uswa")
        ),
          body: SingleChildScrollView ( //agar halaman bisa di scroll
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Home(), //memanggil widget home untuk di eksekusi
                ],
              )
            ),
          )
        ),
    );
  }
}



