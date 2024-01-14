import 'dart:math';

List<String> attackOptions= ['TL', 'TR', 'BL', 'BR'];

class Game {

  List<String> playerList = [];
  List<String> enemyList = [];
  int score = 0;
  bool newGame = true;
  bool gameOver = false;
  bool newRound = false;
  double rotation = 0.0;



  // Adds a random attack to the enemies list of attacks
  void addEnemyList() {
    Random random = Random();
    int randomIndex = random.nextInt(attackOptions.length);
    String randomAttack = attackOptions[randomIndex];
    enemyList.add(randomAttack);
  }

  // Adds the button press to the list of players
  // block (Adds the button that was clicked)
  void addPlayerList(block) {
    playerList.add(block);
  }

  double swordRotation() {
    if (enemyList.isNotEmpty == true)
      for (int i = 0; i <= enemyList.length - 1; i++) {
        if (enemyList[i] == 'TR') {
          rotation = 2.35619;
        } else if (enemyList[i] == 'TL') {
          rotation =  0.785398;
        }
        else if (enemyList[i] == 'BR') {
          rotation =  3.92699;
        }
        else if (enemyList[i] == 'BL') {
          rotation =  5.49779;
        }
      }
    return 0.0;
  }

  void checkGameOver() {
    for (int i = 0; i < playerList.length ; i++) {
      if (playerList[i] == enemyList[i]) {
        if (playerList.length == enemyList.length && playerList.last == enemyList.last) {
          print('--------------------');
          playerList = [];
          addEnemyList();
          score += 1;
          newRound = true;
          print(score);
          print('enemy list');
          print(enemyList);
          print('player list');
          print(playerList);  // delete this if here for testing
        }
      } else {
        print('Game over');
        gameOver = true;
      }
    }
  }
}
