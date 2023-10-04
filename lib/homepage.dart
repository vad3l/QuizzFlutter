import 'package:flutter/material.dart';
import 'package:untitled1/quizzpage.dart';
import 'package:untitled1/editionpage.dart';
import 'package:untitled1/Question.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void fetchQuestionsFromUrl() async {
    final url = Uri.parse('https://dept-info.univ-fcomte.fr/SAMP/Ressources/quizz_monde_animal.json');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)["quizz"];
        // Parse the JSON data and convert it into a list of Question objects
        tableDesQuestions = jsonData.map((data) => Question.fromJson(data)).toList();

        // Afficher une snackbar verte en cas de succès
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('Chargement réussi'),
          ),
        );
      } else {
        // Afficher une snackbar rouge en cas d'erreur
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Échec du chargement'),
          ),
        );
      }
    } catch (e) {
      // Afficher une snackbar rouge en cas d'exception
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Une erreur s\'est produite : $e'),
        ),
      );
    }
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
            ),
            TextButton(
              onPressed: (){
                fetchQuestionsFromUrl();
              },
              style: buttonStyle,
              child: Text('Récuper JSON quizz'),
            ),
          ],
        ),
      ),
    );
  }
}


