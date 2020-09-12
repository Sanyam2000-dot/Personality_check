import 'package:flutter/material.dart';
import './questions.dart';
import './answers.dart';
void main()
{
runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}


  class MyAppState extends State<MyApp>{
  var questionIndex=0;
  void answerQuestion()
  {
    setState(() {
      questionIndex=questionIndex+1;
    });

    print(questionIndex);
  }
  @override
  Widget build(BuildContext context)
  {
    var questions=[
      { "questionText" : "what is your favourite animal",
        "answers": ["lion","tiger","snake","leopard"]
      },
      { "questionText" : "what is your favourite colour",
        "answers": ["black","blue","red","pink"]
      }

    ];
    return MaterialApp(home:
    Scaffold(
      appBar: AppBar(title: Text("PERSONALITY TEST"),
      ),
      body: questionIndex<questions.length ? Column(
        children: [
          Questions(
            questions[questionIndex]["questionText"],
          ),
        ...((questions[questionIndex]["answers"] as List<String>).map((answer){
        return Answer(answerQuestion,answer);
      })).toList()

          ],
      ): Center(child: Text(("You did it!!"),
      style: TextStyle(fontSize: 40)))
      ),
    );
  }
}
