import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sih_2023/features/ui/home/view/home.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomePcreen extends StatefulWidget {
  const HomePcreen({Key? key}) : super(key: key);

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePcreen> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SwipeableButtonView(
                  buttonText: 'CREATE ROOM',
                  buttonWidget: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                  activeColor: Colors.blue,
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        setState(
                          () {
                            isFinished = true;
                          },
                        );
                      },
                    );
                  },
                  onFinish: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const HomeScreen(),
                      ),
                    );
                    setState(
                      () {
                        isFinished = false;
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
