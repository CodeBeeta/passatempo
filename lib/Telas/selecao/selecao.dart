import 'package:flutter/material.dart';
import '../minigames/tictactoe.dart';

class Selecao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecione um dos minigames!"),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => tictactoe()));},
                child: Text('Jogo da Velha!')),
            RaisedButton(
                onPressed: () {
                  null;},
                child: Text('Jogo 3!')),
            RaisedButton(
                onPressed: () {
                  null;},
                child: Text('Jogo 4!'))
          ],
        )
        ),
      );
  }
}