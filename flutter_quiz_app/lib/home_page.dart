import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/my_quiz_page.dart';
import 'package:flutter_quiz_app/quiz_model.dart';
import 'package:flutter_quiz_app/quiz_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            // decoration: BoxDecoration(
            //     // gradient: LinearGradient(colors: [Colors.amber, Colors.pink]),
            //     ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100))),
              child: GridView.builder(
                itemCount: quizes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 40),
                itemBuilder: (context, index) {
                  return itemDashBoard(
                      quizes[index].title, quizes[index].imageData, index);
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                //GridView.count بعدين غيرنل على لابيلدر
                // crossAxisCount: 2,
                // crossAxisSpacing: 40,
                //  mainAxisSpacing: 30,
                //  children: [

                // itemDashBoard('Dart', 'assets/images/dart.png', Colors.white),
                // itemDashBoard(
                //     'C#.net', 'assets/images/CSharp.png', Colors.white),
                // itemDashBoard('C++', 'assets/images/CPlus.png', Colors.white),
                // itemDashBoard('Java', 'assets/images/java.png', Colors.white),
                // itemDashBoard(
                //     'Python', 'assets/images/python.png', Colors.white),

                // itemDashBoard(
                //     'Dart', Icons.play_circle_outline, Colors.purple),
                // itemDashBoard(
                //     'C#.net', Icons.play_circle_outline, Colors.green),
                // itemDashBoard('C++', Icons.play_circle_outline, Colors.teal),
                // itemDashBoard(
                //     'Python', Icons.play_circle_outline, Colors.blue),
                // itemDashBoard(
                //     'Java', Icons.play_circle_outline, Colors.pinkAccent),
                // itemDashBoard(
                //     'Php', Icons.play_circle_outline, Colors.amberAccent),
                // itemDashBoard('Asp.net', Icons.play_circle_outline,
                //     Colors.lightGreenAccent),
                //],
              ),
            ),
          ),
        ],
      ),
    );
  }

  itemDashBoard(String title, String imageData, int index) => InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            print('the ---------------------------$index');
            return MyQuizPage(quizIndex: index);

            //  QuizPage(
            //   quizIndex: index,
            // );
          }));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 100,
              width: 100,
              child: Image.asset(
                imageData,
                fit: BoxFit.contain,
              ),
              //  Icon(
              //   iconData,
              //   color: Colors.white,
              // ),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ]),
        ),
      );
}
