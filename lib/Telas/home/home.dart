import 'package:flutter/material.dart';
import '../selecao/selecao.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PassaTempo App', style: TextStyle(color: Colors.white, fontSize: 20.0)),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Começar!'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Selecao()),
            );
          },
        ),
      ),
    );
  }
}