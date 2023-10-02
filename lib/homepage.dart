import 'package:flutter/material.dart';
import './quizzpage.dart';
import './editionpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



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
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[

                  TextButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyEditionPage (title : "Édition")));
                    },
                    style: buttonStyle,
                    child: Text('Édition'),
                  ),
                  const SizedBox(width:10),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyQuizzPage (title : "Quizz")));
                    },
                    style: buttonStyle,
                    child: Text('Jouer'),
                  ),
                ]
            )
          ],
        ),
      ),
    );
  }
}


