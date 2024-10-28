import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smile/question_identifier.dart';


class SummaryItem extends StatelessWidget{
  const SummaryItem(this.ItemData, {super.key});

  final Map<String,Object> ItemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswers =
      ItemData['user_answer'] == ItemData['correct_answer'];
    
    return Row(
     crossAxisAlignment: CrossAxisAlignment.center,
     children:[       
      QuestionIdentifier(
        isCorrectAnswers: isCorrectAnswers, 
        questionIndex:
         ItemData['question_index'] as int,
        ),
        const SizedBox(width:20,),
        Expanded(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ItemData['question'] as String,
                style:GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  ),
              ),
              const SizedBox(
                height:5, 
              ),
              Text(ItemData['user_answer'] as String, 
              style: const TextStyle(
                color: Color.fromARGB(255, 190, 208, 218),
              )),
              Text(ItemData['correct_answer'] as String, 
              style: const TextStyle(
                color: Color.fromARGB(255, 133, 167, 185),
              )),
            ],
          ),
          ),
        ]
    );
  }
}