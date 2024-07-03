import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/home_page.dart';
import 'package:flutter_quiz_app/questions_model.dart';
import 'package:flutter_quiz_app/quiz_page.dart';
import 'package:flutter_quiz_app/report_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {super.key, required this.correct, required this.wrong, this.quizIndex});
  int correct;
  int wrong;
  int? quizIndex;

  int averageValue() {
    double average = correct / quizData.length * 100;
    return average.toInt();
  }

  @override
  Widget build(BuildContext context) {
    //average = correct / quizData.length;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: Column(children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  averageValue() >= 60
                      ? Image.asset(
                          'assets/images/quiz.jpg',
                          width: 300,
                          height: 300,
                        )
                      : Image.asset(
                          'assets/images/quiz.jpg',
                          width: 300,
                          height: 300,
                        ),
                  Text(
                    averageValue() >= 60 ? 'Result Passed' : 'Result Failed',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color:
                          averageValue() >= 60 ? Colors.green : Colors.red[800],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'your average ${averageValue()} %',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
              child: Container(
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green[100]),
                child: Row(
                  children: [
                    Icon(
                      Icons.done,
                      size: 30,
                      color: Colors.green[800],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'you have $correct correct of ${quizData.length} answers',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                            color: Colors.green[800]),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red[100]),
                child: Row(
                  children: [
                    Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.red[800],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Oops you have $wrong wrong of ${quizData.length} answers',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                            color: Colors.red[800]),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) {
                          // return QuizPage();
                          return HomePage();
                        }), (route) => false);
                      },
                      child: Container(
                        height: 55,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepPurple,
                        ),
                        child: Text(
                          'return quiz',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ReportPage(
                              quizIndex: quizIndex,
                            );
                          }),
                        );
                      },
                      child: Container(
                        height: 55,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepPurple,
                        ),
                        child: Text(
                          'Go Report',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          )),
        ]),
      ),
    );
  }
}
