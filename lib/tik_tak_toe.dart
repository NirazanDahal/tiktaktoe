import 'package:flutter/material.dart';

class TikTakToe extends StatefulWidget {
  const TikTakToe({super.key});

  @override
  State<TikTakToe> createState() => _TikTakToeState();
}

class _TikTakToeState extends State<TikTakToe> {
  //To add icon image
  var cross = const Icon(Icons.clear, size: 80);
  var circle = const Icon(Icons.circle, size: 80);
  var initialIcon = const Icon(Icons.check_box_outline_blank_rounded);

  //Initialize box with empty value
  bool iscross = true;
  String? message;
  List<String>? gameState;
  @override
  void initState() {
    gameState = List.filled(9, 'Empty');
    message = '';
    super.initState();
  }

  //To play game
  playGame(int index) {
    if (gameState![index] == 'Empty') {
      setState(() {
        if (iscross) {
          gameState![index] = 'cross';
        } else {
          gameState![index] = 'circle';
        }
        iscross = !iscross;
      });
    }
  }

//To reset game
  resetGame() {
    setState(() {
      gameState = List.filled(9, 'Empty');
      message = '';
    });
  }

  //To get icon image
  Icon getImage(String title) {
    switch (title) {
      case ('empty'):
        return initialIcon;
      case ('cross'):
        return cross;
      case ('circle'):
        return circle;
    }
    return const Icon(
      Icons.check_box_outline_blank_rounded,
      size: 80,
    );
  }

  //To check for winning
  checkWin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TikTakToe"), centerTitle: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: gameState!.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 100,
                    width: 100,
                    child: MaterialButton(
                        onPressed: () {
                          playGame(index);
                        },
                        child: getImage(gameState![index])),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              resetGame();
            },
            child: const Text("Reset")));
  }
}
