// ignore_for_file: file_names, use_super_parameters

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:kiya/child/widgets/boxes.dart';
import 'package:kiya/child/widgets/drawer.dart';
import 'package:kiya/child/widgets/piece.dart';

//2 * 2 list
List<List<Tetromino?>> gameBoard =
    List.generate(col, (i) => List.generate(row, (i) => null));

class ChildPlay extends StatefulWidget {
  const ChildPlay({Key? key}) : super(key: key);

  @override
  State<ChildPlay> createState() => _ChildPlayState();
}

class _ChildPlayState extends State<ChildPlay> {
  double value = 0;
  int row = 10;
  int col = 12;
  int score = 0;
  int highscore = -1;
  Piece currentPiece = Piece(type: Tetromino.TTT);
  bool over = false;
  bool isGameStarted = false;
  late Timer _timer = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();
  }

  @override
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startGame() {
    setState(() {
      isGameStarted = true;
    });
    currentPiece.genPieces();

    Duration frameRate = const Duration(milliseconds: 500);
    _timer = Timer.periodic(frameRate, (timer) {
      if (mounted) {
        setState(() {
          checkLanding();
          if (gameOver()) {
            timer.cancel();
            showGameOver();
          }
          currentPiece.pieceMove(Directions.down);
        });
      } else {
        timer.cancel();
      }
    });
  }

  void endGame() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    setState(() {
      isGameStarted = false;
    });
  }

  void showGameOver() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 51, 49, 44),
        content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: const Text(
            "Game Over",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              resetGame();
            },
            child: const Text("Play Again"),
          ),
        ],
      ),
    );
  }

  bool collisionDet(Directions direction) {
    for (int i = 0; i < currentPiece.positions.length; i++) {
      int currow = (currentPiece.positions[i] / row).floor();
      int curcol = currentPiece.positions[i] % row;

      if (direction == Directions.left) {
        curcol -= 1;
      } else if (direction == Directions.right) {
        curcol += 1;
      } else if (direction == Directions.down) {
        currow += 1;
      }

      if (currow > 11 || curcol < 0 || curcol >= row) {
        return true;
      }
      if (currow >= 0 && curcol >= 0) {
        if (gameBoard[currow][curcol] != null) {
          return true;
        }
      }
    }
    return false;
  }

  void checkLanding() {
    if (collisionDet(Directions.down)) {
      for (int i = 0; i < currentPiece.positions.length; i++) {
        int currow = (currentPiece.positions[i] / row).floor();
        int curcol = currentPiece.positions[i] % row;
        if (currow >= 0 && curcol >= 0) {
          gameBoard[currow][curcol] = currentPiece.type;
        }
      }
      score += 4;
      newPiece();
    }
  }

  void newPiece() {
    Random rand = Random();
    Tetromino randoType =
        Tetromino.values[rand.nextInt(Tetromino.values.length)];
    currentPiece = Piece(type: randoType);
    currentPiece.genPieces();
    if (gameOver() == true) {
      over = true;
    }
  }

  void moveLeft() {
    if (!collisionDet(Directions.left)) {
      setState(() {
        currentPiece.pieceMove(Directions.left);
      });
    }
  }

  void resetGame() {
    setState(() {});
    gameBoard = List.generate(col, (i) => List.generate(row, (i) => null));
    over = false;
    score = 0;
    newPiece();
    startGame();
  }

  void moveRight() {
    if (!collisionDet(Directions.right)) {
      setState(() {
        currentPiece.pieceMove(Directions.right);
      });
    }
  }

  bool gameOver() {
    for (int i = 0; i < row; i++) {
      if (gameBoard[0][i] != null) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerPage(
            high: highscore,
          ),

          //Menu Animation
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY(pi / 6 * val),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      value == 1 ? value = 0 : value = 0;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Scaffold(
                      backgroundColor: const Color.fromRGBO(27, 18, 18, 1),
                      body: SafeArea(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        value == 0 ? value = 1 : value = 0;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[400],
                                      ),
                                      child: Lottie.asset(
                                        'assets/images/splash/4.json',
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                  const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "T",
                                        style: TextStyle(
                                          color: Colors.cyan,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "e",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 22, 223, 29),
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "t",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "r",
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "i",
                                        style: TextStyle(
                                          color: Colors.deepPurpleAccent,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "x",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 248, 93, 144),
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                            Expanded(
                              child: GridView.builder(
                                itemCount: row * col,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: row,
                                ),
                                itemBuilder: (context, index) {
                                  int currow = (index / row).floor();
                                  int curcol = index % row;

                                  if (currentPiece.positions.contains(index)) {
                                    return Boxes(
                                      color: currentPiece.color,
                                    );
                                  } else if (gameBoard[currow][curcol] !=
                                      null) {
                                    final Tetromino? tetType =
                                        gameBoard[currow][curcol];
                                    return Boxes(
                                      color: tetColors[tetType],
                                    );
                                  } else {
                                    return Boxes(
                                      color:
                                          const Color.fromARGB(255, 46, 37, 37),
                                    );
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: moveLeft,
                                    icon: const Icon(
                                      Icons.arrow_back_rounded,
                                      size: 30,
                                    ),
                                    color: Colors.white,
                                  ),
                                  ElevatedButton(
                                    onPressed:
                                        isGameStarted ? endGame : startGame,
                                    child:
                                        Text(isGameStarted ? 'End' : 'Start'),
                                  ),
                                  IconButton(
                                    onPressed: moveRight,
                                    icon: const Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 30,
                                    ),
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 34, 32, 31),
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.red, width: 2),
                                ),
                                child: Text(
                                  "Score : $score",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
            },
          ),
        ],
      ),
    );
  }
}
