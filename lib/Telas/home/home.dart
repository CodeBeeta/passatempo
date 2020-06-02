import 'package:flutter/material.dart';
import 'package:passatempoapp/Telas/menu/menu_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 169, 205, 1),
      body: Column(
        children: <Widget>[
          Image.asset("images/home/chocolate_derretido.png"),
          Expanded(
            child: Image.asset("images/home/logo_passatempo.png"),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Menu())),
                    },
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Image.asset(
                          "images/home/cookie.png",
                          height: 100.0,
                        ),
                        Text("Jogar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ))
                      ],
                    ),
                  ),
                  Spacer(flex: 2),
                  FlatButton(
                    onPressed: () => {},
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Image.asset(
                          "images/home/gear.png",
                          height: 50.0,
                        ),
                        Text("Configuração",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}