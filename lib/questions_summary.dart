

import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

   final List<Map<String, Object>> summaryData;
   
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
       child: SingleChildScrollView(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
           children: summaryData.map(
           (data) {
             return Row(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 45),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  height: 50,
                  width: 50,
                 decoration: const BoxDecoration( color: Colors.black54 ,shape: BoxShape.circle),
                  child: Center(
                    child: Text(((data['question_index']  as int) + 1).toString(), 
                    style: const TextStyle(color: Colors.white
                    ),),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
                height: 30,
                ),
               Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Text(data['question'] as String, style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54
                  ),
                 ),
                 const SizedBox(
                  height: 3,
                 ),
                 Text(data['user_answer'] as String, style: TextStyle(
                  fontSize: 16,
                  color: data['user_answer'] == data['correct_answer']?  Colors.green: Colors.black
                ),),
                 Text(data['correct_answer'] as String, style: const TextStyle(
                  fontSize: 16,
                  color:  Colors.green
                ),),
               ],
              ),
             )
          ],);
         },
        ).toList()
      ),
    ),
  );
 }
}