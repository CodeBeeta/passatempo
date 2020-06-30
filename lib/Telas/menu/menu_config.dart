import 'package:flutter/material.dart';
import 'dart:io';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecione um dos minigames!", style: TextStyle(color: Colors.white, fontSize: 20.0)),
      ),
      body: Center(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                    null;},
                  child: Text('Jogo 1!')),
              RaisedButton(
                  onPressed: () {
                    null;},
                  child: Text('Jogo da Velha!')),
              RaisedButton(
                  onPressed: () {
                    null;},
                  child: Text('Jogo 3!')),
              RaisedButton(
                  onPressed: () {
                    exit(0);},
                  child: Text('Sair do App'))
            ],
          )
      ),
    );
  }
}