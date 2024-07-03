import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/home_page.dart';
import 'package:flutter_quiz_app/questions_model.dart';
import 'package:flutter_quiz_app/report_page.dart';

class MyResultPage extends StatelessWidget {
  MyResultPage(
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
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
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
                padding: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          averageValue() >= 60
                              ? Image.asset(
                                  'assets/images/quiz.jpg',
                                  width: 250,
                                  height: 250,
                                )
                              : Image.asset(
                                  'assets/images/quiz.jpg',
                                  width: 250,
                                  height: 250,
                                ),
                          Text(
                            averageValue() >= 60
                                ? 'Result Passed'
                                : 'Result Failed',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: averageValue() >= 60
                                  ? Colors.green
                                  : Colors.red[800],
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
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 22),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 22),
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
                          height: 40,
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
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Text(
                                    'return quiz',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
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
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  child: Text(
                                    'Go Report',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
