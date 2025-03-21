import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.center,
        spacing: 40,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(115, 255, 255, 255),
          ),
          Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Colors.red, // Change this to any color you want
                width: 2, // Optional: change the border width
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  12,
                ), // <-- change radius here
              ),
            ),
            onPressed: switchScreen,
            icon: Icon(Icons.arrow_forward_rounded, color: Colors.white),
            label: Text(
              "Start Quiz",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // OutlinedButton(
          //   style: OutlinedButton.styleFrom(
          //     side: BorderSide(
          //       color: Colors.red, // Change this to any color you want
          //       width: 2, // Optional: change the border width
          //     ),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(
          //         12,
          //       ), // <-- change radius here
          //     ),
          //   ),
          //   onPressed: () {},
          //   child: Row(
          //     spacing: 10,
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Icon(Icons.arrow_forward, color: Colors.white),
          //       Text(
          //         "Start Quiz",
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
