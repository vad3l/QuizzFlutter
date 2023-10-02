import 'package:flutter/material.dart';

class MyQuizzPage extends StatefulWidget {
  const MyQuizzPage({super.key, required this.title});

  final String title;

  @override
  State<MyQuizzPage> createState() => _MyQuizzPageState();
}

class _MyQuizzPageState extends State<MyQuizzPage> {
  int _counterPoint = 0;
  int _index = 0;

  List<List<dynamic>> _questions = [
    ["Le diable de Tasmanie vit dans la jungle du Brésil ?", false],
    ["La sauterelle saute l'équivalent de 200 fois sa taille ?", true],
    ["Les pandas hibernent ?", false],
    ["On trouve des dromadaires en liberté en Australie ?", true],
    ["Le papillon monarque vole plus de 4000 km ?", true],
    ["Les gorilles mâles dorment dans les arbres ?", false]
  ];

  String _current_question = "Le diable de Tasmanie vit dans la jungle du Brésil ?";



  void _reset() {
    setState(() {
      _index = 0;
      _counterPoint = 0;
      _current_question = _questions[0][0];
    });
  }

  void _next(){
    if(_index <4) {
      _index++;
      _current_question = _questions[_index][0];
    }else{
      _current_question = "Bravo, Tu as eu ${_counterPoint}/5 !";
    }
  }

  void _true(){
    setState(() {
      if (_questions[_index][1]){
        _counterPoint++;
      }
      _next();
    });
  }

  void _false(){
    setState(() {

      if (!_questions[_index][1]){
        _counterPoint++;
      }
      _next();
    });
  }


  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(10.0),
        backgroundColor: Colors.greenAccent,
        primary: Colors.black, // Text color
        textStyle: TextStyle(fontSize: 20),
        minimumSize: Size(80, 60) // Set the width and height to create a square button
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counterPoint/5',
              style:const TextStyle(
                color: Colors.greenAccent,
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height:100),
            Text(
              '$_current_question',
              textAlign: TextAlign.center,
              style:const TextStyle(

                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height:20),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[

                  TextButton(
                    onPressed: _true,
                    style: buttonStyle,
                    child: Text('VRAI'),
                  ),
                  const SizedBox(width:10),
                  TextButton(
                    onPressed: _false,
                    style: buttonStyle,
                    child: Text('FAUX'),
                  ),
                ]
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reset,
        tooltip: 'Next',
        child: const Icon(Icons.circle),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


