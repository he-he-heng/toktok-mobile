import 'package:flutter/material.dart';
import 'package:toktok_mobile/features/utilities/custom_backbutton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child:  Column(
            children: [
             const CustomBackButton(assetName: 'assets/images/backButton.png'),
             const SizedBox(height: 30),
             signUpTextArea(),

            ],
          ),
        )),
    );
  }
}

Widget signUpTextArea() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        signUpText1(),
        signUpText2(),
      ],
    );
}

Widget signUpText1() {
  return const Text(
    '만나서 반가워요!',
    style: TextStyle(
      fontSize: 24,
    ),
  );
}

Widget signUpText2() {
  return const Text(
    '휴대폰 번호로 로그인해주세요',
    style: TextStyle(
      fontSize: 24,
    ),
  );
}

