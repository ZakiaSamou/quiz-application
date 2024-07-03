import 'package:flutter_quiz_app/questions_model.dart';

class QuizModel {
  String title;
  String imageData;
  List<QuestionsModel> questions;

  QuizModel(
      {required this.questions, required this.title, required this.imageData});
}

List<QuizModel> quizes = [
  QuizModel(
      questions: flutterQuizData,
      title: 'Flutter',
      imageData: 'assets/images/flutter.png'),
  QuizModel(
      questions: dartQuizData,
      title: 'Dart',
      imageData: 'assets/images/dart.png'),
  QuizModel(
      questions: dartQuizData,
      title: 'C#.net',
      imageData: 'assets/images/CSharp.png'),
  QuizModel(
      questions: dartQuizData,
      title: 'C++',
      imageData: 'assets/images/CPlus.png'),
  QuizModel(
      questions: dartQuizData,
      title: 'Java',
      imageData: 'assets/images/java.png'),
  QuizModel(
      questions: dartQuizData,
      title: 'Python',
      imageData: 'assets/images/python.png'),
];

List<QuestionsModel> flutterQuizData = [
  QuestionsModel(
      questions: 'What program language in flutter ?',
      answers: [
        AnswersModel(identitire: 'A', answer: 'dart'),
        AnswersModel(identitire: 'B', answer: 'php'),
        AnswersModel(identitire: 'C', answer: 'c++'),
      ],
      correctAnswer: 'A'),
  QuestionsModel(
      questions: 'Is flutter cross platform ?',
      answers: [
        AnswersModel(identitire: 'A', answer: 'yes'),
        AnswersModel(identitire: 'B', answer: 'No'),
      ],
      correctAnswer: 'A'),
  QuestionsModel(
      questions: 'MVC ?',
      answers: [
        AnswersModel(identitire: 'A', answer: 'Model '),
        AnswersModel(identitire: 'B', answer: 'View'),
        AnswersModel(identitire: 'C', answer: 'Controller'),
        AnswersModel(identitire: 'D', answer: 'Model View Controller'),
      ],
      correctAnswer: 'D'),
];

List<QuestionsModel> dartQuizData = [
  QuestionsModel(
      questions: 'What platform using dart ?',
      answers: [
        AnswersModel(identitire: 'A', answer: 'flutter'),
        AnswersModel(identitire: 'B', answer: 'php'),
        AnswersModel(identitire: 'C', answer: 'c++'),
      ],
      correctAnswer: 'A'),
  QuestionsModel(
      questions: 'Is dart have oop ?',
      answers: [
        AnswersModel(identitire: 'A', answer: 'yes'),
        AnswersModel(identitire: 'B', answer: 'No'),
      ],
      correctAnswer: 'A'),
  QuestionsModel(
      questions: 'MVC ?',
      answers: [
        AnswersModel(identitire: 'A', answer: 'Model '),
        AnswersModel(identitire: 'B', answer: 'View'),
        AnswersModel(identitire: 'C', answer: 'Controller'),
        AnswersModel(identitire: 'D', answer: 'Model View Controller'),
      ],
      correctAnswer: 'D'),
];

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
