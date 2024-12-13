import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //first player to go is Oh
  bool ohTurn = true;

  List<String> displayExOh = ['', '', '', '', '', '', '', '', '',];

  //when box is tapped
  void _tapped(int index){
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
      }
      else if(!ohTurn && displayExOh[index] == ''){
        displayExOh[index] = 'X';
      }
      //switching turns
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  //check winner
  void _checkWinner() {
    // Check for winning conditions
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
      return;
    }
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDialog(displayExOh[3]);
      return;
    }
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
      return;
    }
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
      return;
    }
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDialog(displayExOh[1]);
      return;
    }
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDialog(displayExOh[2]);
      return;
    }
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
      return;
    }
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
      return;
    }

    // Check for a draw
    if (!displayExOh.contains('')) {
      _showDrawDialog();
    }
  }

  //show draw dialog
  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("It's a Draw!"),
          actions: [
            TextButton(
              child: const Text("Play Again!"),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }


  //show win dialog
  void _showWinDialog( String winner){
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("WINNER IS: $winner"),
            actions: [
              TextButton(
                child: Text("Play Again!"),
                onPressed: (){
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
    if(winner == 'O'){
      ohScore += 1;
    } else if(winner =='X'){
      exScore += 1;
    }
    _clearBoard;

  }
  void _clearBoard(){
    setState(() {
      for(int i =0; i<9; i++){
        displayExOh[i] = '';
      }
    });
  }


  static var myFont = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.black, letterSpacing: 3)
  );
  static var myWhite = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 17)
  );
  var myText = const TextStyle(fontSize: 30, color: Colors.white);
  int ohScore = 0;
  int exScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Player 0", style: myWhite,),
                          Text(ohScore.toString(), style: myWhite,),
                        ],
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Player X", style: myWhite,),
                      Text(exScore.toString(), style: myWhite,),
                    ],
                  ),
                ),
                  ]
                ),
              )
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
            itemCount: 9,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return  GestureDetector(
                onTap: (){
                  _tapped(index);
                },
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[700] ?? Colors.grey,)
                    ),
                    child: Center(
                      child: Text(
                        displayExOh[index],
                        style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40
                      ),),
                    ),
                  ),
              );
            },
            ),
          ),
          Expanded(
              child: Container(
                child: Center(child: Text("TIC TAC TOE", style: myWhite,)),
              )),
      ]
      ),

    );
  }
}
