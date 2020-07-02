import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' show Random;
import 'package:passatempoapp/Telas/menu/menu_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel e Tesoura',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  //to do variables
  int moedasJogo;
  String _ganhador;
  String playerImage;
  String monkeyImage;
  String escolhaPlayer;
  String escolhaMonkey;
  var opcoes = new List<String>();

  HomePage(){
    this._ganhador = "Quem Ganhou?";
    this.playerImage = "images/interrogacao.png";
    this.monkeyImage = "images/interrogacao.png";
    this.escolhaPlayer = "Você Escolheu: ";
    this.escolhaMonkey = "Monkey Escolheu: ";
    opcoes.add('Pedra');
    opcoes.add('Papel');
    opcoes.add('Tesoura');
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //to do functions
  //função que cria o alert
  alertMoedas(BuildContext context){

    TextEditingController customController = TextEditingController();

    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("+10 Moedas para o tesouro \n Total:" + widget.moedasJogo.toString(), textAlign: TextAlign.center,),


      );
    });
  }

  Future load() async {
    var pontos = await SharedPreferences.getInstance();
    var data = pontos.getInt('moeda');

    if (data != null){
      widget.moedasJogo = data;
    }else{
      widget.moedasJogo = 0;
    }
  }

  save() async {
    var pontos = await SharedPreferences.getInstance();
    var soma = widget.moedasJogo + 10;
    widget.moedasJogo = soma;
    print(widget.moedasJogo);
    await pontos.setInt('moeda', soma);
  }

  void escolher(String value){
    load();

    if(value=='Pedra'){
      setState(() {
        widget.playerImage="images/pedra.png";
        widget.escolhaPlayer="Você Escolheu: Pedra";
      });
    }else if(value=='Papel'){
      setState(() {
        widget.playerImage="images/papel.png";
        widget.escolhaPlayer="Você Escolheu: Papel";
      });
    }else{
      setState(() {
        widget.playerImage="images/tesoura.png";
        widget.escolhaPlayer="Você Escolheu: Tesoura";
      });
    }

    String random = widget.opcoes[randomBetween(0, 3)];
    String monkey = "images/"+random.toLowerCase()+".png";
    widget.monkeyImage = monkey;
    widget.escolhaMonkey = "Monkey escolheu: "+random;

    if(random == value){
      print('entrou');
      setState(() {
        widget._ganhador = "EMPATOU!!";
      });
    }else if((random=='Papel'&&value=="Pedra") || (random=='Tesoura'&&value=="Papel") || (random=='Pedra'&&value=="Tesoura")  ){
      setState(() {
        widget._ganhador = "TENTE OUTRA VEZ!!";
      });
    }else{
      setState(() {
        widget._ganhador = "VOCÊ GANHOU!!";
        save();
        alertMoedas(context);
      });
    }

  }


  @override
  Widget build(BuildContext context) {

    Widget areaMonkey = new Expanded(
      child: new Container(
        padding: new EdgeInsets.all(8.0),
        color: Color.fromRGBO(0, 169, 205, 1),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Text(widget.escolhaMonkey,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Image.asset(widget.monkeyImage, height: 100.0, ),

          ],
        ),

      ),

    );

    Widget areaPlayer = new Expanded(
      child: new Container(
        padding: new EdgeInsets.all(8.0),
        color: Color.fromRGBO(0, 169, 205, 1),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Text(widget.escolhaPlayer,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Image.asset(widget.playerImage, height: 100.0, ),

          ],
        ),

      ),

    );

    Widget areaResultado = new Container (
      //padding: new EdgeInsets.all(8.0),
      //color: Color.fromRGBO(0, 169, 205, 1),
      height: 50.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(widget._ganhador,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber, fontSize: 30),),
        ],
      ),
    );

    Widget areaEscolha = new Container (
      padding: new EdgeInsets.all(8.0),
      color: Color.fromRGBO(0, 169, 205, 1),
      height: 100.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: (){escolher('Pedra');},
            child: Image.asset("images/pedra.png", height: 100.0,),
          ),
          InkWell(
            onTap: (){escolher('Papel');},
            child: Image.asset("images/papel.png", height: 100.0,),
          ),
          InkWell(
            onTap: (){escolher('Tesoura');},
            child: Image.asset("images/tesoura.png", height: 100.0,),
          ),
        ],
      ),
    );

    Widget body = new Column(
      // This makes each child fill the full width of the screen
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        areaMonkey,
        areaPlayer,
        areaResultado,
        areaEscolha,
      ],
    );


    return new Scaffold(
      backgroundColor: Color.fromRGBO(0, 169, 205, 1),
      appBar: AppBar(
        title: Text('Pedra, Papel e Tesoura!'),
        backgroundColor: Colors.red,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.settings), onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Config())); }, color: Colors.white),
    ]
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: body,
      ),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/