import 'package:flutter/material.dart';
import 'package:toktok_mobile/features/authentication/application/signup/widgets/welcome_screen_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              // introduceArea를 Expanded로 감싸서 중앙에 배치
              Expanded(
                child: Center(
                  child: introduceArea(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    navigateToSignUpButton(context),
                    const SizedBox(height: 10), // 위젯 사이 10만큼의 여백 
                    navigateToLoginArea(context), 
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

