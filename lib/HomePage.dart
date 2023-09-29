import 'package:flutter/material.dart';
import 'package:tic_tac/GameLogic.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;
  bool isTurn = true;
  bool GameOver = false;
  int TurnNumber = 0;
  String result = '';
  Game game = Game();

  void OnTap(int index) async {
    if ((Player.PlayerX.isEmpty || !Player.PlayerX.contains(index)) &&
        (Player.PlayerO.isEmpty || !Player.PlayerO.contains(index))) {
      game.GameTurn(index, isTurn);
      Update();
    }
    if (!isSwitched && !GameOver&&TurnNumber!=9) {
      await game.autoPlay(isTurn);
      Update();
    }
  }

  void Update() {
    setState(() {
      isTurn = isTurn ? false : true;
      if (TurnNumber==9) {
        GameOver = true;
      } else {
        TurnNumber++;
      }
      String winner = game.CheckWinner();
      if (winner != '') {
        GameOver = true;
        result = winner;
      } else if(TurnNumber==9&&!GameOver) {
        result = "It's Draw";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SwitchListTile.adaptive(
              title: Text(
                'turn On/Off two player mode',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              inactiveTrackColor:Colors.grey,
              value: isSwitched,
              onChanged: (val) {
                setState(() {
                  isSwitched = val;
                });
              }),
          SizedBox(
            height: 20,
          ),
          Text(
            "it's ${isTurn ? 'x' : 'o'} turn".toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              childAspectRatio: 1,
              children: List.generate(
                9,
                (index) => InkWell(
                  onTap: GameOver ? null : () => OnTap(index),
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      Player.PlayerX.contains(index)
                          ? 'X'
                          : Player.PlayerO.contains(index)
                              ? 'O'
                              : '',
                      style: TextStyle(
                          color: Player.PlayerX.contains(index)
                              ? Theme.of(context).primaryColorDark
                              : Theme.of(context).primaryColorLight,
                          fontSize: 80),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            result,
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              setState(() {
                Player.PlayerX.clear();
                Player.PlayerO.clear();
                result = '';
                isTurn = true;
                TurnNumber = 0;
                GameOver = false;
              });
            },
            borderRadius: BorderRadius.circular(15),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.refresh),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Re-Play'),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
