import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smile/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smile/data/question4.dart';
import 'package:smile/models/quiz.questions.dart';
import 'package:smile/result_sceen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  //  QuestionsScreen({super.key,required this.time ,required this.onSelectAnswer, required this.ourLenght,});

// final void Function(String answer) onSelectAnswer;

//   int ourLenght;
//   bool time;
  @override
  State<QuestionsScreen> createState() { 
return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  PageController controller = PageController();
   List<String> selectedAnswers = [];
   Timer? _timer;
  var currentQuestionIndex = 0;
     void restartQuiz() {
  setState(() {
    selectedAnswers = [];
    
  //  activeScreen = 'questions_screen';
  });
}
   void chooseAnswer(answer,  QuizQuestion question) {
      selectedAnswers.add(answer);

      if (selectedAnswers.length == questions.length) {
        // setState(() {
        //  // activeScreen = 'result-screen';
        // });
        
         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ResultsScreen(        choosenAswers: selectedAnswers,
         onRestart: restartQuiz,);
         }));
      setState(() {
    question.answerQuestion = !question.answerQuestion; // Set selectedAnswers to true
      // You can also handle answer logic here
    });
      }else{
       setState(() {
          currentQuestionIndex ++ ;
       });
      }
   }
  int ourTime = 60;
  bool? isTrue;


void answerQuestion( selectedAnswers, QuizQuestion question,) {
  //widget.onSelectAnswer(selectedAnswers);
  chooseAnswer(selectedAnswers, question);
    setState(() {
    question.answerQuestion = !question.answerQuestion; // Set selectedAnswers to true
      // You can also handle answer logic here
      isTrue = question.answerQuestion;
    });

    
  // currentQuestionIndex = currentQuestionIndex + 1;
  //  currentQuestionIndex += 1;
  // setState(() {
  // });
  // currentQuestionIndex ++;  // increments the value by 1
}

 void nextQuestion() {
    setState(() {
      if (currentQuestionIndex == questions.length - 1) {
     return;
      } else {
        setState(() {
             currentQuestionIndex++; 
        });
        
       }});}





void startTimer() {
  Duration duration = const Duration(minutes: 1);
  final timer = 
  Timer.periodic(duration, (t){
    setState(() {
      ourTime++;
    });

  });
  
  }
 


 
@override
  void initState() {
  //   // TODO: implement initState
  
  // var id =  selectedAnswers.contains(questions.map((e){return e.answers.map((e){
  //                           print('this answer $e');
  //                           return e;
  //                         });}));
  //                       print('is ther $id');


    Duration duration = const Duration(seconds: 1);
  // final timer = 
 _timer = Timer.periodic(duration, (t){
    setState(() {
       if(ourTime == 0) {
       Navigator.of(context).pop();
      }else {
        setState(() {
           ourTime--;
        });  
       }
    //  ourTime--;
    });
       setState(() {
         
       });
  });
    super.initState();
  }
  @override 
  void dispose(){
    _timer!.cancel();
    super.dispose();
  

  }
  @override
  Widget build(context) {
    var currentQuestion = questions[currentQuestionIndex];

     return Scaffold(
       body: Container(
         width: double.infinity,
         height: double.infinity,color: Colors.white,

         child: Container(height: double.infinity, width: double.infinity,        
          margin: const EdgeInsets.all(40),
          //  color: Colors.red,
           child: Column( 
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             
               Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              GestureDetector(
              child:  Text('$ourTime', style: const TextStyle(color: Colors.black, fontSize:20, fontWeight:FontWeight.bold ),),),
               GestureDetector(
                onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ResultsScreen(
        choosenAswers: selectedAnswers,
         onRestart: restartQuiz,
      );
                }));
                _timer!.cancel();
                setState(() {
                  
                });
                },
                 child: Container(
                             height: 50,width: 100, 
                             decoration: const BoxDecoration(color: Colors.green,
                  shape:BoxShape.rectangle,
                             borderRadius: BorderRadius.all(Radius.circular(30),),
                             ),
                             child: const Center(child: Text('Submit', style: TextStyle(color:Colors.white,  fontSize:20, fontWeight:FontWeight.bold),),
                             
                             ),
                           ),
               )]),
           const SizedBox(height: 50, width: 200,),
            Text(
             currentQuestion.text,
           style: GoogleFonts.lato(
             color:  Colors.black87,
             fontSize: 25,
           ),
           textAlign: TextAlign.center,
           ),
            const SizedBox(height:70),
              ...currentQuestion.getOriginalAnswers().map((answer) {
                return AnswerButton(
                  answerText: answer,
                  isTrue: selectedAnswers.contains(answer), 
                  onTap: () {
                    setState(() {
                      if (selectedAnswers.contains(answer)) {
                        selectedAnswers.remove(answer);
                      }else{
                        selectedAnswers.add(answer);
                      }
                    });
                      
                  }
                );
              }), 
              const SizedBox(height: 100, width: 200,),
            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              GestureDetector(
                onTap: (){
             setState(() {
           if (currentQuestionIndex == 0) {
       return;
      }else{
        setState(() {
          currentQuestionIndex--;
        });
      }
             });    
                },
              child: Container(
              height: 50,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.rectangle,borderRadius: BorderRadius.all(Radius.circular(30),
                ),),
                child: const Center(child: Text('Previous', style: TextStyle(color:Colors.white,  fontSize:20, fontWeight:FontWeight.bold),),),
                 ),),
               GestureDetector(
                onTap: () {
                 nextQuestion();
    // chooseAnswer((selectedAnswers) );
                },
                 child: Container(
                             height: 50,width: 100, 
                             decoration: const BoxDecoration(color: Colors.black54,
                  shape:BoxShape.rectangle,
                             borderRadius: BorderRadius.all(Radius.circular(30),),
                             ),
                             child: const Center(child: Text('Next', style: TextStyle(color:Colors.white,  fontSize:20, fontWeight:FontWeight.bold), textAlign: TextAlign.right,),
                             ),
                           ),
               )]),
              //  GestureDetector(
              //    onTap: () {
                   
              //    },
              //  )
            
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                 shrinkWrap: true, 
                  itemCount: questions.length,
                  scrollDirection: Axis.horizontal,
                  // onPageChanged: (page){
                  //   setState(() {
                  //     currentQuestionIndex = page;
                  //   }) ;
                  // },
                  itemBuilder:(context, i){
                     var answer = questions[i].answers.map((e) => e).toList().first;
                    // var answer = questions[i].answers[i];
                    // print('as ass ${selectedAnswers.contains(answer) }');
                      //  setState(() {
                      //      questions.answerQuestion = true;
                      //  });
                    print(' true');
                  return Row(
                    children: [
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          // currentQuestion.answerQuestion
                        //   color: selectedAnswers.contains(answer)
                        // ? Colors.green
                        //  : Colors.white;

                         setState(() {
                          currentQuestionIndex = i;
                             //questions[i];
                         });
                          //  try{
                          //      print('index ${int.parse(questions[i].answers.elementAt(i))}');
                          // setState(() {
                          //  // selectedAnswers = questions[i].answers;
                          //   currentQuestionIndex = int.parse(questions[i].answers.elementAt(i));
                        
                          // });
                          //  }catch(e){
                          //   print('error $e');
                          //  }
                        },
                        child: Container(
                          height: 50, width: 40,
                          decoration: BoxDecoration(
                            // ignore: collection_methods_unrelated_type
                            color: questions[i].answerQuestion
                            ?Colors.green
                            :Colors.white,
                            shape: BoxShape.circle, ), 
                          child: 
                          Center(
                            child:
                           Text('${i + 1}', style:const TextStyle(fontSize: 30),)),),
                      ),
                    ],
                  );
                 } ),
               ),
             )
          
           ]),
         ), 
       ),
     );
  }
}