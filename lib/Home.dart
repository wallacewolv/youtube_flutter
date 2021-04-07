import 'package:flutter/material.dart';

import 'package:youtube_flutter/telas/Inicio.dart';
import 'package:youtube_flutter/telas/EmAlta.dart';
import 'package:youtube_flutter/telas/Inscricao.dart';
import 'package:youtube_flutter/telas/Biblioteca.dart';

import 'CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black54,
          opacity: 1,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cast),
            onPressed: () {
              print("acao: Share");
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              print("acao: notificação");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              setState(() {
                _resultado = res;
              });
              // print("resultado: digitado " + res);
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("acao: conta");
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        //type: BottomNavigationBarType.shifting,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            title: Text("Inicio"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.green,
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
