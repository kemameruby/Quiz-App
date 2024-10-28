import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smile/questions_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen( {super.key});

  //final void Function() startQuiz;

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 280,
                color: Colors.black54,
              ),
              const SizedBox(height: 80),
              Text(
                'Learn Flutter The Fun Way!',
                style: GoogleFonts.lato(
                  color: Colors.black54,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 30),
              OutlinedButton.icon(
               // onPressed: startQuiz,
               onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const QuestionsScreen();
                }));
               },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Start Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
