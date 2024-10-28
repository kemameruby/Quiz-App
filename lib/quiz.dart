import 'package:flutter/material.dart';
import 'package:smile/data/question4.dart';
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
   bool time = true; 
  void switchScreen() {
    setState(() {
      activeScreen = 'Questions-Screen';
      });
  }

void currentQuestionIndex  = 'Question_Screen';
   String previous = 'timer';
  // final currentQuestionIndex

   


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
   Widget screenWidget = const StartScreen();

    // if (activeScreen == 'Questions-Screen') {
    //    screenWidget = QuestionsScreen(
    //     onSelectAnswer: chooseAnswer,
    //     ourLenght:questions.length,
    //     time : time ,
    //   );
    // }
 
    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
        choosenAswers: selectedAnswers,
         onRestart: restartQuiz,
      );
    }


  return const MaterialApp(
      home: Scaffold(
        body: StartScreen()
      ),
    );
 }


}

// Container(
//           height: MediaQuery.of(context).size.height,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 135, 75, 136),
//                  Color.fromARGB(255, 52, 17, 103),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: screenWidget,
//         ),