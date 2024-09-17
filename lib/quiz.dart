import 'package:flutter/material.dart';
import 'package:smile/data/question4.dart';
import 'package:smile/questions_screen.dart';
import 'package:smile/result_sceen.dart';
import 'package:smile/start_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
 State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
 List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
   
  void switchScreen() {
    setState(() {
      activeScreen = 'Questions-Screen';
      });
  }
   
   void chooseAnswer(String answer) {
      selectedAnswers.add(answer);

      if (selectedAnswers.length == questions.length) {
        setState(() {
          activeScreen = 'result-screen';
        });
      }
   }

void restartQuiz() {
  setState(() {
    selectedAnswers = [];
    activeScreen = 'questions_screen';
  });
}


 @override
 Widget build(context) {
   Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'Questions-Screen') {
       screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
 
    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
        choosenAswers: selectedAnswers,
         onRestart: restartQuiz,
      );
    }


  return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 135, 75, 136),
                 Color.fromARGB(255, 52, 17, 103),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
 }


}

