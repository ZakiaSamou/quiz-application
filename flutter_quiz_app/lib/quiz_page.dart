import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/big_text.dart';
import 'package:flutter_quiz_app/questions_model.dart';
import 'package:flutter_quiz_app/quiz_model.dart';
import 'package:flutter_quiz_app/result_page.dart';
import 'package:flutter_quiz_app/small_text.dart';

class QuizPage extends StatefulWidget {
  QuizPage({
    super.key,
    this.quizIndex,
  });
  int? quizIndex;
  @override
  State<QuizPage> createState() => _QuizPageState(this.quizIndex);
}

class _QuizPageState extends State<QuizPage> {
  _QuizPageState(this.quizIndex);
  int questionNumber = 0;
  int? selectAnswer;
  int correctAnswer = 0;
  int wrongAnswer = 0;
  List<String> questions = ['How are you ?', 'How old are you ?'];
  int? quizIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 75, bottom: 20, right: 20, left: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.orange, Colors.purple]),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Text(
          //   quizData[questionNumber].questions,
          //   style: TextStyle(
          //       fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          // ),
          BigText(quizes[quizIndex!].questions[questionNumber].questions),
          SizedBox(
            height: 10,
          ),
          // Text(
          //   "Number of question : ${questionNumber + 1} of ${quizData.length}",
          //   style: TextStyle(
          //       fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
          // ),
          SmallText(
              "Number of question : ${questionNumber + 1} of ${quizes[quizIndex!].questions.length}"),
          SizedBox(
            height: 30,
          ),
          // Text(
          //   "Answers",
          //   style: TextStyle(
          //       fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          // ),
          BigText("Answers"),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(70, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    BigText(
                      selectAnswer == null
                          ? ''
                          : "Select Answer : ${quizes[quizIndex!].questions[questionNumber].answers[selectAnswer!].identitire}",
                      size: 20,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: quizes[quizIndex!]
                              .questions[questionNumber]
                              .answers
                              .length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectAnswer = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 25.0),
                                child: Container(
                                  height: 55,
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: selectAnswer == index
                                        ? Color(0xA72196F3)
                                        : Color(0xAAFFFFFF),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Text(
                                        //   "${quizData[questionNumber].answers[index].identitire} : ",
                                        //   style: TextStyle(
                                        //       fontSize: 22,
                                        //       color: selectAnswer == index
                                        //           ? Colors.white
                                        //           : Colors.black,
                                        //       fontWeight: FontWeight.bold),
                                        // ),
                                        BigText(
                                          "${quizes[quizIndex!].questions[questionNumber].answers[index].identitire} : ",
                                          color: selectAnswer == index
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        // Text(
                                        //   "${quizData[questionNumber].answers[index].answer}",
                                        //   style: TextStyle(
                                        //       fontSize: 22,
                                        //       color: selectAnswer == index
                                        //           ? Colors.white
                                        //           : Colors.black,
                                        //       fontWeight: FontWeight.bold),
                                        // ),
                                        BigText(
                                          "${quizes[quizIndex!].questions[questionNumber].answers[index].answer}",
                                          color: selectAnswer == index
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        selectAnswer == index
                                            ? Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.circle_outlined,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                  Icon(
                                                    Icons.circle,
                                                    color: Colors.white,
                                                    size: 12,
                                                  ),
                                                ],
                                              )
                                            : Icon(
                                                Icons.circle_outlined,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                      ]),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 60,
          ),
          InkWell(
            onTap: () {
              quizes[quizIndex!].questions[questionNumber].selectAnswer =
                  quizes[quizIndex!]
                      .questions[questionNumber]
                      .answers[selectAnswer!]
                      .identitire;
              if (quizes[quizIndex!]
                      .questions[questionNumber]
                      .answers[selectAnswer!]
                      .identitire ==
                  quizes[quizIndex!].questions[questionNumber].correctAnswer) {
                correctAnswer++;
                print('correct Answer');
              } else {
                print(' no correct Answer');
                wrongAnswer++;
              }
              if (questionNumber < quizes[quizIndex!].questions.length - 1) {
                setState(() {
                  questionNumber++;
                  selectAnswer = null;
                });
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    correct: correctAnswer,
                    wrong: wrongAnswer,
                    quizIndex: quizIndex,
                  );
                }));
              }
            },
            child: Container(
                alignment: Alignment.center,
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [Colors.amber, Colors.pink]),
                ),
                child: BigText(
                  "Next ",
                  size: 20,
                )
                // Text(
                //   "Next ",
                //   style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white),
                // ),
                ),
          ),
        ]),
      ),
    );
  }
}
