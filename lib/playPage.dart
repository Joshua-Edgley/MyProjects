import 'package:flutter/material.dart';
import 'Backend.dart';

bool displaying = false;

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  Game myGame = Game();

  @override
  Widget build(BuildContext context) {
    if (myGame.newGame) {
      myGame.addEnemyList();
      displayAttack();
      myGame.newGame = false;
    }
    print(myGame.enemyList); // delete
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Page'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 250,
            left: MediaQuery.of(context).size.width / 2 - 250,
            child: Image.asset(
              'sprites/Enemy.PNG',
              width: 500,
              height: 500,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 275,
            left: MediaQuery.of(context).size.width / 2 - 150,
            child: Transform.rotate(
              angle: myGame.rotation,
              alignment: Alignment.bottomCenter,// Adjust the angle of rotation in radians
              child: Image.asset(
                'sprites/Sword.PNG',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 400,
              height: 400,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
                children: [
                  buildButton(Colors.red.withOpacity(0.07), () {
                    if (!displaying) {
                      myGame.addPlayerList('TL');
                      print('player list');
                      print(myGame.playerList);
                      myGame.checkGameOver();
                      if (myGame.gameOver) {
                        Navigator.pop(context);
                      }
                      if (myGame.newRound) {
                        displayAttack();
                      }
                    }
                  }),
                  buildButton(Colors.blue.withOpacity(0.07), () {
                    if (!displaying) {
                      myGame.addPlayerList('TR');
                      print('player list');
                      print(myGame.playerList);
                      myGame.checkGameOver();
                      if (myGame.gameOver) {
                        Navigator.pop(context);
                      }
                      if (myGame.newRound) {
                        displayAttack();
                      }
                    }
                  }),
                  buildButton(Colors.green.withOpacity(0.07), () {
                    if (!displaying) {
                      myGame.addPlayerList('BL');
                      print('player list');
                      print(myGame.playerList);
                      myGame.checkGameOver();
                      if (myGame.gameOver) {
                        Navigator.pop(context);
                      }
                      if (myGame.newRound) {
                        displayAttack();
                      }
                    }
                  }),
                  buildButton(Colors.yellow.withOpacity(0.07), () {
                    if (!displaying) {
                      myGame.addPlayerList('BR');
                      print('player list');
                      print(myGame.playerList);
                      myGame.checkGameOver();
                      if (myGame.gameOver) {
                        Navigator.pop(context);
                      }
                      if (myGame.newRound) {
                        displayAttack();
                      } // Navigate back to the landing page
                    }
                  }
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  void displayAttack() async {

    displaying = true;

    if (myGame.newGame){
      await Future.delayed(Duration(milliseconds: 1000));
    }

      for (int i = 0; i <= myGame.enemyList.length - 1; i++) {
        if (myGame.enemyList[i] == 'TR') {
          myGame.rotation = 0.785398;
          updateRotation();
          await Future.delayed(Duration(milliseconds: 1000));
          myGame.rotation =  0.0;
          updateRotation();
          await Future.delayed(Duration(milliseconds: 1000));
        } else if (myGame.enemyList[i] == 'TL') {
          myGame.rotation =  5.49779;
          updateRotation();
          await Future.delayed(Duration(milliseconds: 1000));
          myGame.rotation =  0.0;
          updateRotation();
          await Future.delayed(Duration(milliseconds: 1000));
        }
        else if (myGame.enemyList[i] == 'BR') {
          myGame.rotation =  2.35619;
          updateRotation();
          await Future.delayed(Duration(milliseconds: 1000));
          myGame.rotation =  0.0;
          updateRotation();
          await Future.delayed(Duration(milliseconds: 1000));
        }
        else if (myGame.enemyList[i] == 'BL') {
          myGame.rotation =  3.92699;
          updateRotation();
          await Future.delayed(Duration(milliseconds: 1000));
          myGame.rotation =  0.0;
          updateRotation();
          await Future.delayed(Duration(milliseconds: 1000));
        }
      }

    myGame.newRound = false;
      displaying = false;

  }

  void updateRotation() {
    myGame.checkGameOver();
    if (myGame.gameOver) {
      Navigator.pop(context);
    }
    setState(() {
      // Update the UI when myGame.rotation changes
    });
  }

  Widget buildButton(Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 100,
      height: 100,
      child: InkWell(
        onTap: onPressed,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            color: color,
          ),
        ),
      ),
    );
  }
}
