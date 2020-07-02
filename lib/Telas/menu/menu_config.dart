import 'package:flutter/material.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 169, 205, 1),
      appBar: AppBar(
        title: Text("Configurações", style: TextStyle(color: Colors.white, fontSize: 20.0)),
          backgroundColor: Colors.red
      ),
      body: Center(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                    null;},
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                        'Tutoriais',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),
                 ),
              RaisedButton(
                  onPressed: _launchURL,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                        ' Nestlé ',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),
              ),
              RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                        title: Text('Equipe!\nMatheus Marques Alves\nDaianne Gomes Aguiar \nMatheus Moysés Salgado \nRoberta Novaes'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () =>  Navigator.pop(context),
                            child: Text("OK"),
                          ),
                        ],
                      ),
                    );
                    },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                        '  Sobre  ',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),
              ),
              RaisedButton(
                  onPressed: () {
                    exit(0);},
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                        'Sair do App',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset("images/menu/macaco1.png", height: 300.0),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.nestle.com.br/marcas/passatempo';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}