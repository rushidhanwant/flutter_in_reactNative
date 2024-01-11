import "package:flutter/material.dart";
import "package:quiz_app/config.dart";
import "package:quiz_app/data/questions.dart";
import "package:quiz_app/page_template.dart";
import "package:quiz_app/questions_page.dart";
import "package:quiz_app/results_page.dart";
import "package:quiz_app/start_page.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = Config.startScreen;

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    print(selectedAnswers);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = Config.startScreen;
        activeScreen = Config.resultsScreen;
      });
    }
  }

  void switchScreen() {
    selectedAnswers = [];
    setState(() {
      activeScreen = Config.questionsScreen;
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartPage(switchScreen);
    if (activeScreen == Config.questionsScreen) {
      screenWidget = QuestionsPage(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == Config.resultsScreen) {
      screenWidget = ResultsPage(
        switchToQuestionScreen: switchScreen,
        selectedAnswers: selectedAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: PageTemplate(
          backgroundColorsList: Config.backgroundColor,
          pageWidget: screenWidget,
        ),
      ),
    );
  }
}
