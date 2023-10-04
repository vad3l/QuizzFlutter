import 'package:flutter/material.dart';
import 'package:untitled1/Question.dart';
import 'package:untitled1/homepage.dart';

class MyQuizzPage extends StatefulWidget {
  const MyQuizzPage({super.key, required this.title});

  final String title;

  @override
  State<MyQuizzPage> createState() => _MyQuizzPageState();
}

class _MyQuizzPageState extends State<MyQuizzPage> {
  int _counterPoint = 0;
  int _index = 0;
  late String _current_question;

  @override
  void initState() {
    super.initState();
    _current_question = tableDesQuestions[0].questionText; // Start with the first question
  }

  void _reset() {
    setState(() {
      _index = 0;
      _counterPoint = 0;
      _current_question = tableDesQuestions[0].questionText;
    });
  }

  void _next() {
    if (_index < tableDesQuestions.length - 1) {
      _index++;
      _current_question = tableDesQuestions[_index].questionText;
    } else {
      // the end of the quiz
      showEndDialog();
    }
  }

  void _true() {
    setState(() {
      if (tableDesQuestions[_index].answer) {
        _counterPoint++;
      }
      _next();
    });
  }

  void _false() {
    setState(() {
      if (!tableDesQuestions[_index].answer) {
        _counterPoint++;
      }
      _next();
    });
  }

  void showEndDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Set this to false to make it non-dismissible
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Quizz Fini"),
          content: Text("Votre score est $_counterPoint sur ${tableDesQuestions.length}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _reset(); // Reset the quiz
              },
              child: Text("Recommencer"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage (title : "Menu")));

                // Perform any other action you want here.
              },
              child: Text("Fermer"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(10.0),
      backgroundColor: Colors.greenAccent,
      primary: Colors.black, // Text color
      textStyle: TextStyle(fontSize: 20),
      minimumSize: Size(80, 60), // Set the width and height to create a square button
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counterPoint/${tableDesQuestions.length}',
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 100),
            Text(
              '$_current_question',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _true,
                  style: buttonStyle,
                  child: Text('VRAI'),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: _false,
                  style: buttonStyle,
                  child: Text('FAUX'),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
