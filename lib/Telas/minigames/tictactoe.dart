import 'package:flutter/material.dart';
import 'package:passatempoapp/Telas/home/home.dart';
import 'package:passatempoapp/Telas/menu/menu_page.dart';
import 'package:passatempoapp/Telas/menu/menu_config.dart';


class TictactoeGame extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<TictactoeGame> {

  List<List> _matrix;
  String _lastChar = 'O';

  _PageState(){
    _initMatrix();
  }

  void _limpaTudo(){
    setState(() {
      _initMatrix();
    });
  }

  _initMatrix(){
    _matrix = List<List>(3);
    for(var row=0; row < _matrix.length; row++){
      _matrix[row] = List(3);
      for(var column = 0; column < _matrix.length; column++){
        _matrix[row][column] = ' ';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        backgroundColor: Color.fromRGBO(1, 169, 206, 1),
        appBar: AppBar(
          title: Text("Jogo da Velha!", style: TextStyle(color: Colors.white, fontSize: 20.0)),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => Menu(
                    )
                ),
              )),
          backgroundColor: Colors.red,
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.rotate_left), onPressed: _limpaTudo, color: Colors.white),
            IconButton(icon: Icon(Icons.settings), onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Config())); }, color: Colors.white),
          ],
        ),
        body: Center(
            child: Stack(
              children: [_buildGrid(), _buildField()],
            )),
      ),
    );
  }

  _buildGrid(){
    return new AspectRatio(
        aspectRatio: 1.0,
        child: Stack(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildHorizontalLine,
                  buildHorizontalLine,
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildVerticalLine,
                  buildVerticalLine,
                ])
          ],
        ));
  }

  Container get buildHorizontalLine{
    return new Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      color: Colors.white,
      height: 5.0,
    );
  }

  Container get buildVerticalLine{
    return new Container(
      margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
      color: Colors.white,
      width: 5.0,
    );
  }

  _buildField(){
    return new AspectRatio(
        aspectRatio: 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCell(0,0),
                      _buildCell(0,1),
                      _buildCell(0,2),
                    ])),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCell(1,0),
                      _buildCell(1,1),
                      _buildCell(1,2),
                    ])),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCell(2,0),
                      _buildCell(2,1),
                      _buildCell(2,2),
                    ])),
          ],
        ));
  }

  _buildCell(int row, int column){
    return new AspectRatio(
        aspectRatio: 1.0,
        child: GestureDetector(
            onTap: (){
              _changeMatrixField(row, column);
              _checkWinner(row, column);
            },
            child: _buildCellItem(row, column)));
  }

  _changeMatrixField(int row, int column){
    setState(() {
      if (_matrix[row][column] == ' ') {
        if (_lastChar == 'O')
          _matrix[row][column] = 'X';

        else
          _matrix[row][column] = 'O';

        _lastChar = _matrix[row][column];
      }
    });
  }

  _buildCellItem(int row, int column){
    var cell = _matrix[row][column];
    if(cell.isNotEmpty){
      if (cell == 'X'){
        return Container(
          padding: EdgeInsets.all(2.0),
          child: Center(
              child: Text(cell, style: TextStyle(fontSize: 90.0, color: Colors.redAccent))),
        );
      } else {
        return Container(
          padding: EdgeInsets.all(2.0),
          child: Center(
              child: Text(cell, style: TextStyle(fontSize: 90.0, color: Colors.orangeAccent))),
        );
      }
    }
  }

  _checkWinner(int x, int y){
    var col = 0, row = 0, diag = 0, rdiag = 0;
    var n = _matrix.length-1;
    var player = _matrix[x][y];

    for (int i = 0; i < _matrix.length; i ++){
      if (_matrix[x][i] == player)
        col++;

      if (_matrix[i][y] == player)
        row++;

      if (_matrix[i][i] == player)
        diag++;

      if (_matrix[i][n-i] == player)
        rdiag++;
    }
    if (row == n+1 || col == n+1 || diag == n+1 || rdiag == n+1){

      print('$player Venceu');
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text('Parabéns!\nO jogador com "$player" venceu!'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => TictactoeGame(
                    ),
                  ),
                );
              },
              child: Text("RECOMEÇAR"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => Menu(
                      )
                  ),
                );
              },
              child: Text("VOLTAR"),
            ),
          ],
        ),
      );
    }
  }
}