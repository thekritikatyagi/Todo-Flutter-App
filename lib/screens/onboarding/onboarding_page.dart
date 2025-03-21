import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/home/home_view.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: SizedBox(
                  height: 500,
                  width: 500,
                  child: Image(
                    image: AssetImage('assets/images/onbording.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "Reach your goals",
                style: theme.textTheme.headline1,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Achive your goals on the path to success.",
                style: theme.textTheme.bodyText2,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () => Get.to(
                      () => const HomeView(),
                      popGesture: false,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      primary: theme.colorScheme.primary,
                    ),
                    child: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
