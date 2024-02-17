import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/Cat-First Screen.png',
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * 0.7,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 20,
                            height: 5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFE0E0E1),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Container(
                            width: 20,
                            height: 5,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8BE13),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Container(
                            width: 20,
                            height: 5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFE0E0E1),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your One-Stop Pet Shop\nExperience!',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF141415),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Connect with 5-star pet caregivers near\n you who offer boarding, walking, house\n sitting or day care.',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA1A1A1),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8BE13),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
