import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class StartPage extends StatelessWidget {
  StartPage(void Function()? onPress, {super.key}) {
    switchScreen = onPress;
  }
  void Function()? switchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 100,
          ),
           Text('Learn Flutter the fun way!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 28,
              )),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
              onPressed: switchScreen,
              icon: const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
                size: 25,
              ),
              label: const Text(
                'Start Quiz',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ))
          // OutlinedButton(
          //     onPressed: () {},
          //     child: const Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Icon(
          //           Icons.arrow_right_alt,
          //           color: Colors.white,
          //           size: 25,
          //         ),
          //         SizedBox(
          //           width: 10,
          //         ),
          //         Text(
          //           'Start Quiz',
          //           style: TextStyle(color: Colors.white, fontSize: 15),
          //         ),
          //       ],
          //     ),
        ],
      ),
    );
  }
}
