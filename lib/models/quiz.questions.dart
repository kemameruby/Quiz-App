// class QuizQuestion {
//   const QuizQuestion(this.text, this.answers, [the]);

//   final String text;
//   final List<String> answers;

// List<String>getShuffledAnswers() {
//   final shuffledlist =List.of(answers);
//   shuffledlist.shuffle();
//   return shuffledlist;
// }
// }
class QuizQuestion {
   QuizQuestion(this.text, this.answers,{this.questions =false,required this.answerQuestion});


  final String text;
   bool answerQuestion;
   bool questions;
  
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

  List<String> getOriginalAnswers() {
    return List.of(answers); // Return a copy of the original answers
  }
}
