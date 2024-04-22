import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quest_arcade_app/router/router.dart';
import 'package:quest_arcade_app/screens/games/merge_numbers/square_colors.dart';
import 'package:quest_arcade_app/theme/colors.dart';
import 'tile.dart';
import 'grid.dart';
import 'game.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

@RoutePage()
class MergeNumbersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MergeNumbersScreenState();
  }
}

class _MergeNumbersScreenState extends State<MergeNumbersScreen> {
  List<List<int>> grid = [];
  List<List<int>> gridNew = [];
  int score = 0;
  bool isgameOver = false;
  bool isgameWon = false;

  List<Widget> getGrid(double width, double height) {
    List<Widget> grids = [];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        int num = grid[i][j];
        String number;
        int color;

        if (num == 0) {
          color = SquareColors.emptyGridBackground;
          number = "";
        } else if (num == 2) {
          color = SquareColors.color2;
          number = "${num}";
        } else if (num == 4) {
          color = SquareColors.color4;
          number = "${num}";
        } else if (num == 8) {
          color = SquareColors.color8;
          number = "${num}";
        } else if (num == 16) {
          color = SquareColors.color16;
          number = "${num}";
        } else if (num == 32) {
          color = SquareColors.color32;
          number = "${num}";
        } else if (num == 64) {
          color = SquareColors.color64;
          number = "${num}";
        } else if (num == 128) {
          color = SquareColors.color128;
          number = "${num}";
        } else if (num == 256) {
          color = SquareColors.color256;
          number = "${num}";
        } else if (num == 512) {
          color = SquareColors.color512;
          number = "${num}";
        } else if (num == 1024) {
          color = SquareColors.color1024;
          number = "${num}";
        } else {
          color = SquareColors.color2048;
          number = "${num}";
        }

        double size = 0;
        String n = "${number}";
        switch (n.length) {
          case 1:
          case 2:
            size = 40.0;
            break;
          case 3:
            size = 30.0;
            break;
          case 4:
            size = 20.0;
            break;
        }
        grids.add(Tile(number, width, height, color, size));
      }
    }
    return grids;
  }

  void handleGesture(int direction) {
    /*
    
      0 = up
      1 = down
      2 = left
      3 = right

    */
    bool flipped = false;
    bool played = true;
    bool rotated = false;
    if (direction == 0) {
      setState(() {
        grid = transposeGrid(grid);
        grid = flipGrid(grid);
        rotated = true;
        flipped = true;
      });
    } else if (direction == 1) {
      setState(() {
        grid = transposeGrid(grid);
        rotated = true;
      });
    } else if (direction == 2) {
    } else if (direction == 3) {
      setState(() {
        grid = flipGrid(grid);
        flipped = true;
      });
    } else {
      played = false;
    }

    if (played) {
      print('playing');
      List<List<int>> past = copyGrid(grid);
      print('past ${past}');
      for (int i = 0; i < 4; i++) {
        setState(() {
          List result = operate(grid[i], score);
          score = result[0];
          print('score in set state ${score}');
          grid[i] = result[1];
        });
      }
      setState(() {
        grid = addNumber(grid, gridNew);
      });
      bool changed = compare(past, grid);
      print('changed ${changed}');
      if (flipped) {
        setState(() {
          grid = flipGrid(grid);
        });
      }

      if (rotated) {
        setState(() {
          grid = transposeGrid(grid);
        });
      }

      if (changed) {
        setState(() {
          grid = addNumber(grid, gridNew);
          print('is changed');
        });
      } else {
        print('not changed');
      }

      bool gameover = isGameOver(grid);
      if (gameover) {
        context.router.push(MergeNumbersWinRoute(score: score));
        print('game over');
        setState(() {
          isgameOver = true;
        });
      }

      bool gamewon = isGameWon(grid);
      if (gamewon) {
        context.router.push(MergeNumbersWinRoute(score: score));
        print("GAME WON");
        setState(() {
          isgameWon=true;
        });
      }
      print(grid);
      print(score);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    grid = blankGrid();
    gridNew = blankGrid();
    addNumber(grid, gridNew);
    addNumber(grid, gridNew);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    double gridWidth = (width - 80) / 4;
    double gridHeight = gridWidth;
    double height = 30 + (gridHeight * 4) + 50;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/elements/game-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.router.push(HomeRoute());
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.white15,
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0))),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Merge numbers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 1),
                Container(
                  width: 180,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.white15,
                      border: Border.all(
                          color: AppColors.blueBorder, width: 2),
                      borderRadius:
                      BorderRadius.all(Radius.circular(8.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/elements/coin.png'),
                      SizedBox(width: 5),
                      Text(
                        '${score}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: height,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      child: GridView.count(
                        primary: false,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        crossAxisCount: 4,
                        children: getGrid(gridWidth, gridHeight),
                      ),
                      onVerticalDragEnd: (DragEndDetails details) {
                        //primaryVelocity -ve up +ve down
                        if (details.primaryVelocity! < 0) {
                          handleGesture(0);
                        } else if (details.primaryVelocity! > 0) {
                          handleGesture(1);
                        }
                      },
                      onHorizontalDragEnd: (details) {
                        //-ve right, +ve left
                        if (details.primaryVelocity! > 0) {
                          handleGesture(2);
                        } else if (details.primaryVelocity! < 0) {
                          handleGesture(3);
                        }
                      },
                    ),
                  ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}