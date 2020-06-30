import 'package:flutter/material.dart';
import 'package:passatempoapp/Telas/home/home.dart';
import 'package:passatempoapp/Telas/minigames/jankenpo.dart';
import 'package:passatempoapp/Telas/minigames/memory_game.dart';
import 'package:passatempoapp/Telas/minigames/tictactoe.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 169, 205, 1),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: new Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Home(
                                      )
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Vamos",
                        style: TextStyle(
                            color: Color.fromRGBO(224, 72, 85, 1),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "Jogar",
                    style: TextStyle(
                        color: Color.fromRGBO(254, 237, 1, 1),
                        fontSize: 55.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage())),
                  },
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Image.asset(
                        "images/menu/blackjack.png",
                        height: 100.0,
                      ),
                      Text("Pedra, Papel, Tesoura",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MemoryGame())),
                  },
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Image.asset(
                        "images/menu/memory.png",
                        height: 100.0,
                      ),
                      Text("Jogo da Memória",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TictactoeGame())),
                  },
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Image.asset(
                        "images/menu/tic-tac-toe.png",
                        height: 100.0,
                      ),
                      Text("Jogo da Velha",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset("images/menu/macaco1.png", height: 140.0),
                ),
                Expanded(
                    child: Image.asset(
                      "images/menu/marketing.png",
                      height: 120.0,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}