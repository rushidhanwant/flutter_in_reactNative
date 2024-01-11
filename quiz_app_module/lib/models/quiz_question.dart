class QuizQuestion {

  QuizQuestion(this.question,this.answer);

  final String question;
  final List<String> answer;

  List<String> getShuffledAnswers() {
    final list = List.of(answer);
    list.shuffle();
    return list;
  }
}