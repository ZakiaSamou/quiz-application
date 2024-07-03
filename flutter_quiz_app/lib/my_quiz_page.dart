import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/big_text.dart';
import 'package:flutter_quiz_app/my_result.dart';
import 'package:flutter_quiz_app/quiz_model.dart';
import 'package:flutter_quiz_app/result_page.dart';
import 'package:flutter_quiz_app/small_text.dart';

class MyQuizPage extends StatefulWidget {
  MyQuizPage({
    super.key,
    this.quizIndex,
  });
  int? quizIndex;
  @override
  State<MyQuizPage> createState() => _MyQuizPageState(this.quizIndex);
}

class _MyQuizPageState extends State<MyQuizPage> {
  _MyQuizPageState(this.quizIndex);
  int questionNumber = 0;
  int? selectAnswer;
  int correctAnswer = 0;
  int wrongAnswer = 0;
  int? quizIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              // gradient: LinearGradient(colors: [Colors.amber, Colors.pink]),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50))),
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              title: Text(
                'Quiz App',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.white),
              ),
              subtitle: Text(
                'Welcome..',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white54),
              ),
              trailing: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/quiz.jpg'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ]),
        ),
        Container(
          color: Theme.of(context).primaryColor,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100))),
            child: Container(
              padding:
                  EdgeInsets.only(top: 30, bottom: 20, right: 20, left: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: Theme.of(context).primaryColor.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromRGBO(255, 0, 0, 0.3),
                      const Color.fromRGBO(156, 39, 176, 0.3)
                    ]),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      quizes[quizIndex!].questions[questionNumber].questions,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SmallText(
                      "Number of question : ${questionNumber + 1} of ${quizes[quizIndex!].questions.length}",
                      color: Color.fromARGB(255, 13, 78, 134),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    BigText(
                      "Answers",
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                            color: Color.fromARGB(255, 148, 1, 1),
                          ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          ListView.builder(
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
                                    padding:
                                        const EdgeInsets.only(bottom: 25.0),
                                    child: Expanded(
                                      child: Container(
                                        height: 60,
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: selectAnswer == index
                                              ? Theme.of(context).primaryColor
                                              : Color(0xAAFFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                "${quizes[quizIndex!].questions[questionNumber].answers[index].identitire} : ",
                                                color: selectAnswer == index
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                              Expanded(
                                                child: BigText(
                                                  "${quizes[quizIndex!].questions[questionNumber].answers[index].answer}",
                                                  color: selectAnswer == index
                                                      ? Colors.white
                                                      : Colors.black,
                                                  size: 18,
                                                ),
                                              ),
                                              selectAnswer == index
                                                  ? Stack(
                                                      alignment:
                                                          Alignment.center,
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
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                // SizedBox(
                //   height: 60,
                // ),
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
                        quizes[quizIndex!]
                            .questions[questionNumber]
                            .correctAnswer) {
                      correctAnswer++;
                      print('correct Answer');
                    } else {
                      print(' no correct Answer');
                      wrongAnswer++;
                    }
                    if (questionNumber <
                        quizes[quizIndex!].questions.length - 1) {
                      setState(() {
                        questionNumber++;
                        selectAnswer = null;
                      });
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        // return ResultPage(
                        //   correct: correctAnswer,
                        //   wrong: wrongAnswer,
                        //   quizIndex: quizIndex,
                        // );
                        return MyResultPage(
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
                        gradient: LinearGradient(
                            colors: [Colors.purple, Colors.pink]),
                      ),
                      child: BigText(
                        "Next ",
                        size: 20,
                      )),
                ),
              ],
            ))
      ],
    ));
  }
}
