import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smile/data/question4.dart';
import 'package:smile/questions_summary.dart';
import 'package:smile/quiz.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key, 
    required this.choosenAswers,
    required this.onRestart,
  });

 final void Function() onRestart;  
  final List<String> choosenAswers;

 List<Map<String, Object>> getSummaryData() {
   final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAswers.length; i ++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAswers[i]
       },
     );
    }

   return summary;

  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

     return  Scaffold(
       body: Container(
         width: double.infinity,
         height: double.infinity,color: Colors.white,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                style: GoogleFonts.lato(
                  color: Colors.black54,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
               ),
               const SizedBox(
                height: 40,
                ),
                QuestionsSummary(summaryData),
               const SizedBox(
                height: 40,
               ),
               TextButton.icon(
                //onPressed: onRestart,
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context){
                    return const Quiz();
                  }));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black45,
                foregroundColor: Colors.white
                ),
                icon: const Icon(Icons.refresh),
                label: const Text('Restart quiz'),
              ),
            ],
          ),
        ),
       )
    );
  }
}