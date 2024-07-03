class QuestionsModel {
  String questions;
  List<AnswersModel> answers;
  String correctAnswer;
  String? selectAnswer;

  QuestionsModel(
      {required this.questions,
      required this.answers,
      required this.correctAnswer,
      this.selectAnswer});
}

class AnswersModel {
  String identitire;
  String answer;
  AnswersModel({required this.identitire, required this.answer});
}

List<QuestionsModel> quizData = [
  QuestionsModel(
      questions: 'How are you ?',
      answers: [
        AnswersModel(identitire: 'A', answer: 'Yes'),
        AnswersModel(identitire: 'B', answer: 'No'),
        AnswersModel(identitire: 'C', answer: 'No'),
      ],
      correctAnswer: 'A'),
  QuestionsModel(
      questions: 'How old are you ?',
      answers: [
        AnswersModel(identitire: 'A', answer: '20'),
        AnswersModel(identitire: 'B', answer: '40'),
        AnswersModel(identitire: 'C', answer: '80'),
        AnswersModel(identitire: 'D', answer: '25'),
      ],
      correctAnswer: 'B'),
  QuestionsModel(
      questions: 'What do you learn ?',
      answers: [
        AnswersModel(identitire: 'A', answer: 'C++'),
        AnswersModel(identitire: 'B', answer: 'Flutter'),
        AnswersModel(identitire: 'C', answer: 'Database'),
        AnswersModel(identitire: 'D', answer: 'Dart'),
      ],
      correctAnswer: 'B'),
];
