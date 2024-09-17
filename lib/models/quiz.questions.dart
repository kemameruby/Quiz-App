class QuizQuestion {
  const QuizQuestion(this.text, this.answers, [the]);

  final String text;
  final List<String> answers;

List<String>getShuffledAnswers() {
  final shuffledlist =List.of(answers);
  shuffledlist.shuffle();
  return shuffledlist;
}
}