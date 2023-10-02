import 'package:flutter/material.dart';
import 'main.dart';

class MyEditionPage extends StatefulWidget {
  const MyEditionPage({super.key, required this.title});

  final String title;

  @override
  State<MyEditionPage> createState() => _MyEditionPageState(title);
}

class _MyEditionPageState extends State<MyEditionPage> {
  TextEditingController textFieldController = TextEditingController();
  final String title;

  bool isTrueSelected = true;
  _MyEditionPageState(this.title);



  void insertQuestion(String question) {
    setState(() {});

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('AlertDialog with Radio Buttons and TextField'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Radio(
                        value: true,
                        groupValue: isTrueSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            isTrueSelected = value!;
                          });
                        },
                      ),
                      Text('True'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: false,
                        groupValue: isTrueSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            isTrueSelected = value!;
                          });
                        },
                      ),
                      Text('False'),
                    ],
                  ),
                  TextField(
                    controller: textFieldController,
                    decoration: InputDecoration(labelText: 'Enter text'),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    // Do something with the selected value and text
                    bool selectedValue = isTrueSelected;
                    String enteredText = textFieldController.text;

                    // Close the dialog
                    Navigator.of(context).pop();

                    // Perform any further actions you need with the values
                    // (e.g., use them in your application logic)
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }



// Fonction pour afficher la boîte de dialogue
  void _showAlertDialogAddQuestion(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Ajouter une question'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Radio(
                        value: true,
                        groupValue: isTrueSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            isTrueSelected = value!;
                          });
                        },
                      ),
                      Text('True'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: false,
                        groupValue: isTrueSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            isTrueSelected = value!;
                          });
                        },
                      ),
                      Text('False'),
                    ],
                  ),
                  TextField(
                    controller: textFieldController,
                    decoration: InputDecoration(labelText: 'Question'),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Annuler'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Ajouter'),
                  onPressed: () {
                    // Do something with the selected value and text
                    bool selectedValue = isTrueSelected;
                    String enteredText = textFieldController.text;

                    // Close the dialog
                    Navigator.of(context).pop();
                    tableDesQuestions.add(Question(enteredText,selectedValue));

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MyEditionPage(title: "Édition"),
                    ));
                    // Perform any further actions you need with the values
                    // (e.g., use them in your application logic)
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }



// Fonction pour afficher la boîte de dialogue
  void _showAlertDialogModifieQuestion(BuildContext context, Question choiceQuestion) {
    isTrueSelected = choiceQuestion.answer;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Édition question'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Radio(
                        value: true,
                        groupValue: isTrueSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            isTrueSelected = value!;
                          });
                        },
                      ),
                      Text('True'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: false,
                        groupValue: isTrueSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            isTrueSelected = value!;
                          });
                        },
                      ),
                      Text('False'),
                    ],
                  ),
                  TextField(
                    controller: textFieldController,
                    decoration: InputDecoration(
                      labelText: 'Question',
                      hintText: choiceQuestion.questionText, // Texte par défaut
                    ),

                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Annuler'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Supprimer'),
                  onPressed: () {
                    supprimerQuestion(choiceQuestion);
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MyEditionPage(title: "Édition"),
                    ));
                  },
                ),
                TextButton(
                  child: Text('Modifier'),
                  onPressed: () {
                    // Do something with the selected value and text
                    bool selectedValue = isTrueSelected;
                    String enteredText = textFieldController.text;

                    // Close the dialog
                    Navigator.of(context).pop();
                    if(enteredText == ""){
                      enteredText = choiceQuestion.questionText;
                    }
                    modifierQuestion(choiceQuestion,Question(enteredText,selectedValue));

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MyEditionPage(title: "Édition"),
                    ));
                    // Perform any further actions you need with the values
                    // (e.g., use them in your application logic)
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: tableDesQuestions.length,
        itemBuilder: (BuildContext context, int index) {
          String estDansLeQuizz =
          (tableDesQuestions[index]!.answer) == true ? "Vrai" : "Faux";

          return Card(
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(tableDesQuestions[index].questionText),
                    onTap: () {
                      _showAlertDialogModifieQuestion(context,tableDesQuestions[index]);

                    },
                  ),
                ),
                Text(estDansLeQuizz),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAlertDialogAddQuestion(context); // Appel de la fonction pour afficher la boîte de dialogue
        },
        tooltip: 'Ajouter une question',
        child: const Icon(Icons.add),
      ),

    );
  }
}
