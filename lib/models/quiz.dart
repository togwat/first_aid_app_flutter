class Quiz {
  const Quiz(this.questions);

  final List<QuizQuestion> questions;
}

class QuizQuestion {
  const QuizQuestion(this.question, this.choices, this.answer);

  final String question;
  final List<String> choices;
  final int answer; // index
}