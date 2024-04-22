import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quest_arcade_app/router/router.dart';
import 'package:quest_arcade_app/screens/games/checkers/models/game.dart';
import 'package:quest_arcade_app/theme/colors.dart';

@RoutePage()
class CheckersScreen extends StatefulWidget {
  const CheckersScreen({Key? key}) : super(key: key);

  @override
  State<CheckersScreen> createState() => _CheckersScreenState();
}

class CheckerView {
  int x = 0;
  int y = 0;
  bool isSecond = false;
  bool isModify = false;

  CheckerView(this.x, this.y, this.isSecond, this.isModify);

  CheckerView.from(Keker? kek) {
    if (kek != null) {
      x = kek.X;
      y = kek.Y;
      isSecond = kek.isSecond;
      isModify = kek.isModify;
    }
  }

  CheckerView.copy(CheckerView? kek) {
    if (kek != null) {
      x = kek.x;
      y = kek.y;
      isSecond = kek.isSecond;
      isModify = kek.isModify;
    }
  }
}

class _CheckersScreenState extends State<CheckersScreen> {
  final _moveNotifier = ValueNotifier<CheckerView?>(null);
  final _kekerNotifier = ValueNotifier<List<Keker>>(Game.getAll());
  final _logNotifier = ValueNotifier<List<String>>(Game.logMessage);
  var key = GlobalKey();

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    Game.init();
    _kekerNotifier.value = Game.getAll();
    _moveNotifier.value = Game.getSelected() != null
        ? CheckerView.from(Game.getSelected())
        : null;
    _logNotifier.value = Game.logMessage;
  }

  void move(int i, int j) {
    if (Game.getSelected() != null) {
      //if(Game.canMove(i, j)){
      Game.move(i, j);
      var t = CheckerView.copy(_moveNotifier.value);
      var t2 = Game.getLastSelected();
      t.x = t2!.X;
      t.y = t2.Y;
      _moveNotifier.value = t;
      _logNotifier.value = Game.logMessage;
      //}
      if (Game.logMessage[2].isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.blueBorder,
            content: Text(
              '${Game.logMessage[2]}',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        );
      }
    }
  }

  void afterVisualMove() {
    _moveNotifier.value = Game.getSelected() != null
        ? CheckerView.from(Game.getSelected())
        : null;
    _kekerNotifier.value = Game.getAll();
    _logNotifier.value = Game.logMessage;
    checkLogs();
  }

  void select(int i, int j) {
    var t = Game.select(i, j);
    //print(t);
    key = GlobalKey();
    _kekerNotifier.value = Game.getAll();
    _moveNotifier.value = Game.getSelected() != null
        ? CheckerView.from(Game.getSelected())
        : null;
    _logNotifier.value = Game.logMessage;
  }

  String turn = 'White';

  void checkLogs() {
    if (Game.logMessage[0].isNotEmpty) {
      context.router.push(CheckersWinRoute(winner: Game.logMessage[0]));
    }
    if (Game.logMessage[1].isNotEmpty) {
      turn = Game.logMessage[1];
      setState(() {});
    }
  }

  @override
  void dispose() {
    _moveNotifier.dispose();
    _kekerNotifier.dispose();
    _logNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    double size = shortestSide * 0.85;
    double cellSize = size * 0.125;
    double kekerSize = size * 0.09375;
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
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
                      'Checkers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.white15,
                    border: Border.all(color: AppColors.blueBorder, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Turn: $turn',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    turn == 'Blue'
                        ? Image.asset('assets/images/checkers/blue-checker.png',
                            width: 30)
                        : Image.asset(
                            'assets/images/checkers/white-checker.png',
                            width: 30),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  verticalDirection: VerticalDirection.up,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size,
                      height: size,
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Board(
                                callback: move,
                                cellSize: cellSize,
                              )),
                          ValueListenableBuilder(
                              valueListenable: _kekerNotifier,
                              builder: (_, List<Keker> value, __) {
                                return Checker(
                                  cellSize: cellSize,
                                  kekerSize: kekerSize,
                                  list: value,
                                  callback: select,
                                );
                              }),
                          ValueListenableBuilder(
                              valueListenable: _moveNotifier,
                              builder: (_, CheckerView? value, __) {
                                //print("generete anim");
                                return value != null
                                    ? AnimatedPositioned(
                                        onEnd: () => afterVisualMove(),
                                        key: key,
                                        duration: const Duration(seconds: 1),
                                        top: (cellSize - kekerSize) / 2 +
                                            cellSize * value.x,
                                        left: (cellSize - kekerSize) / 2 +
                                            cellSize * value.y,
                                        child: Container(
                                          width: kekerSize,
                                          height: kekerSize,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: value.isSecond
                                                    ? AssetImage(
                                                        'assets/images/checkers/blue-checker.png')
                                                    : AssetImage(
                                                        'assets/images/checkers/white-checker.png'),
                                              ),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2)),
                                          child: value.isModify
                                              ? Center(
                                                  child: Image.asset(
                                                      'assets/images/checkers/king.png',
                                                      width: 20))
                                              : null,
                                          //child: GestureDetector(onTap: ()=>visualMove(value[0], value[1]),)
                                        ),
                                      )
                                    : Container();
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class Checker extends StatelessWidget {
  const Checker(
      {Key? key,
      required this.list,
      this.callback,
      required this.cellSize,
      required this.kekerSize})
      : super(key: key);
  final List<Keker> list;
  final Function(int, int)? callback;
  final double cellSize;
  final double kekerSize;

  List<Widget> kekers() {
    List<Widget> result = [];

    var t = Game.getAll();
    var padd = (cellSize - kekerSize) / 2;
    for (int i = 0; i < t.length; i++) {
      result.add(Positioned(
        top: padd + cellSize * t[i].X,
        left: padd + cellSize * t[i].Y,
        child: GestureDetector(
          onTap: () => callback?.call(t[i].X, t[i].Y),
          child: Container(
            width: kekerSize,
            height: kekerSize,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: t[i].isSecond
                      ? AssetImage('assets/images/checkers/blue-checker.png')
                      : AssetImage('assets/images/checkers/white-checker.png'),
                ),
                shape: BoxShape.circle),
            child: t[i].isModify
                ? Center(
                    child: Image.asset('assets/images/checkers/king.png',
                        width: 20))
                : null,
          ),
        ),
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    //print("generate Checker");
    return Stack(
      children: [
        ...kekers(),
      ],
    );
  }
}

class Cell extends StatelessWidget {
  const Cell(
      {Key? key, this.color = Colors.black, required this.size, this.call})
      : super(key: key);
  final double size;
  final Color color;
  final Function? call;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: color,
      child: GestureDetector(
        onTap: () => call?.call(),
      ),
    );
  }
}

class Board extends StatelessWidget {
  const Board({Key? key, required this.callback, required this.cellSize})
      : super(key: key);
  final Function(int, int) callback;
  final double cellSize;

  List<Widget> area({Function(int, int)? callback}) {
    List<Widget> result = [];
    bool f = false;
    for (int i = 0; i < 64; i++) {
      Color color;
      bool b = i % 2 == 0;
      if (i % 8 == 0) {
        f = !f;
      }

      if (f) {
        b = !b;
      }

      color = b ? AppColors.blackSquare : AppColors.whiteSquare;
      result.add(Cell(
        size: cellSize,
        color: color,
        //call: b?()=>callback?.call(i~/8,i%8):null,
        call: () => callback?.call(i ~/ 8, i % 8),
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    //print("generate");
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: cellSize,
      ),
      children: area(callback: callback),
    );
  }
}
