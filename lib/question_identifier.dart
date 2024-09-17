import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswers,
    required this.questionIndex,
  });
  final int questionIndex;
  final bool isCorrectAnswers;


 @override
 Widget build(BuildContext context) {
  final questionNumber = questionIndex + 1;
  return Container(
    width: 30,
    height: 38,
    alignment: Alignment.center,
    decoration:BoxDecoration(
      color: isCorrectAnswers
         ? const Color.fromARGB(255, 19, 19, 19)
         : const Color.fromARGB(255, 219, 48, 105), 
      borderRadius: BorderRadius.circular(90),
     ),
    child: Text(
      questionNumber.toString(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color:Color.fromARGB(255, 24, 21, 130) 
      ),
    ),
  );
 }
}