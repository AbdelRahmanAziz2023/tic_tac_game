import 'dart:math';

class Player {
  static const X = 'X';
  static const O = 'O';
  static const empty = '';
  static List<int> PlayerX = [];
  static List<int> PlayerO = [];
}

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class Game {
  void GameTurn(int index, bool isTurn) {
    if (isTurn == true) {
      Player.PlayerX.add(index);
    } else {
      Player.PlayerO.add(index);
    }
  }

  CheckWinner() {
    String result = '';
    if (Player.PlayerX.containsAll(0, 1, 2) ||
        Player.PlayerX.containsAll(0, 3, 6) ||
        Player.PlayerX.containsAll(1, 4, 7) ||
        Player.PlayerX.containsAll(2, 5, 8) ||
        Player.PlayerX.containsAll(6, 7, 8) ||
        Player.PlayerX.containsAll(3, 4, 5) ||
        Player.PlayerX.containsAll(0, 4, 8) ||
        Player.PlayerX.containsAll(2, 4, 6)) {
      result = 'X is Winner';
    } else if (Player.PlayerO.containsAll(0, 1, 2) ||
        Player.PlayerO.containsAll(0, 3, 6) ||
        Player.PlayerO.containsAll(1, 4, 7) ||
        Player.PlayerO.containsAll(2, 5, 8) ||
        Player.PlayerO.containsAll(6, 7, 8) ||
        Player.PlayerO.containsAll(3, 4, 5) ||
        Player.PlayerO.containsAll(0, 4, 8) ||
        Player.PlayerO.containsAll(2, 4, 6)) {
      result = 'O is Winner';
    } else {
      result = '';
    }
    return result;
  }

  Future<void> autoPlay(isTurn) async {
    int index = 0;
    List<int> emptycell = [];
    for (int i = 0; i < 9; i++) {
      if (!(Player.PlayerX.contains(i) || Player.PlayerO.contains(i))) {
        emptycell.add(i);
      }
    }
    //start-center
    if (Player.PlayerO.containsAll(0, 1) && emptycell.contains(2)) {
      index = 2;
    } else if (Player.PlayerO.containsAll(3, 4) && emptycell.contains(5)) {
      index = 5;
    } else if (Player.PlayerO.containsAll(6, 7) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.PlayerO.containsAll(0, 4) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.PlayerO.containsAll(2, 4) && emptycell.contains(6)) {
      index = 6;
    } else if (Player.PlayerO.containsAll(0, 3) && emptycell.contains(6)) {
      index = 6;
    } else if (Player.PlayerO.containsAll(1, 4) && emptycell.contains(7)) {
      index = 7;
    } else if (Player.PlayerO.containsAll(2, 5) && emptycell.contains(8)) {
      index = 8;
    }
    //end-center
    else if (Player.PlayerO.containsAll(1, 2) && emptycell.contains(0)) {
      index = 0;
    } else if (Player.PlayerO.containsAll(4, 8) && emptycell.contains(0)) {
      index = 0;
    } else if (Player.PlayerO.containsAll(3, 6) && emptycell.contains(0)) {
      index = 0;
    } else if (Player.PlayerO.containsAll(4, 6) && emptycell.contains(2)) {
      index = 2;
    } else if (Player.PlayerO.containsAll(5, 8) && emptycell.contains(2)) {
      index = 2;
    } else if (Player.PlayerO.containsAll(7, 8) && emptycell.contains(6)) {
      index = 6;
    } else if (Player.PlayerO.containsAll(4, 7) && emptycell.contains(1)) {
      index = 1;
    } else if (Player.PlayerO.containsAll(4, 5) && emptycell.contains(3)) {
      index = 3;
    }
    //center
    else if (Player.PlayerO.containsAll(0, 8) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerO.containsAll(2, 6) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerO.containsAll(1, 7) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerO.containsAll(3, 5) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerO.containsAll(0, 2) && emptycell.contains(1)) {
      index = 1;
    } else if (Player.PlayerO.containsAll(0, 6) && emptycell.contains(3)) {
      index = 3;
    } else if (Player.PlayerO.containsAll(2, 8) && emptycell.contains(5)) {
      index = 5;
    } else if (Player.PlayerO.containsAll(6, 8) && emptycell.contains(7)) {
      index = 7;
    }
    //start-center
    else if (Player.PlayerX.containsAll(0, 1) && emptycell.contains(2)) {
      index = 2;
    } else if (Player.PlayerX.containsAll(3, 4) && emptycell.contains(5)) {
      index = 5;
    } else if (Player.PlayerX.containsAll(6, 7) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.PlayerX.containsAll(0, 4) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.PlayerX.containsAll(2, 4) && emptycell.contains(6)) {
      index = 6;
    } else if (Player.PlayerX.containsAll(0, 3) && emptycell.contains(6)) {
      index = 6;
    } else if (Player.PlayerX.containsAll(1, 4) && emptycell.contains(7)) {
      index = 7;
    } else if (Player.PlayerX.containsAll(2, 5) && emptycell.contains(8)) {
      index = 8;
    }
    //end-center
    else if (Player.PlayerX.containsAll(1, 2) && emptycell.contains(0)) {
      index = 0;
    } else if (Player.PlayerX.containsAll(4, 8) && emptycell.contains(0)) {
      index = 0;
    } else if (Player.PlayerX.containsAll(3, 6) && emptycell.contains(0)) {
      index = 0;
    } else if (Player.PlayerX.containsAll(4, 6) && emptycell.contains(2)) {
      index = 2;
    } else if (Player.PlayerX.containsAll(5, 8) && emptycell.contains(2)) {
      index = 2;
    } else if (Player.PlayerX.containsAll(7, 8) && emptycell.contains(6)) {
      index = 6;
    } else if (Player.PlayerX.containsAll(4, 7) && emptycell.contains(1)) {
      index = 1;
    } else if (Player.PlayerX.containsAll(4, 5) && emptycell.contains(3)) {
      index = 3;
    }
    //center
    else if (Player.PlayerX.containsAll(0, 8) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerX.containsAll(2, 6) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerX.containsAll(1, 7) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerX.containsAll(3, 5) && emptycell.contains(4)) {
      index = 4;
    } else if (Player.PlayerX.containsAll(0, 2) && emptycell.contains(1)) {
      index = 1;
    } else if (Player.PlayerX.containsAll(0, 6) && emptycell.contains(3)) {
      index = 3;
    } else if (Player.PlayerX.containsAll(2, 8) && emptycell.contains(5)) {
      index = 5;
    } else if (Player.PlayerX.containsAll(6, 8) && emptycell.contains(7)) {
      index = 7;
    } else {
      Random random = Random();
      int RandomIndex = random.nextInt(emptycell.length);
      index = emptycell[RandomIndex];
    }
    GameTurn(index, isTurn);
  }
}
