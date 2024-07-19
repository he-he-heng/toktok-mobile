import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toktok_mobile/presentation/screens/signup/widgets/welcome_screen_widget.dart';
import 'package:toktok_mobile/theme/colors.dart';

class AccountCreationCompleteScreen extends ConsumerWidget {
  const AccountCreationCompleteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: _introduceArea(),
                )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    skipToSetUpProfileButton(context),
                    const SizedBox(height: 10),
                    navigateToSetUpProfileButton(context),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _introduceArea() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Image.asset('assets/images/toktok_profile.png',width: double.infinity, height: 127),
      ),
      SizedBox(height: 20),
      const Text('가입을 진행해 주셔서 감사합니다!',style: TextStyle(fontFamily: 'Pretendard-bold',fontSize: 24)),
      const Text('이젠 프로필을 단장하러 가볼까요?',style: TextStyle(fontFamily: 'Pretendard-bold',fontSize: 24)),
      SizedBox(height: 20),
      Text('마치 사람을 만나기 위해 단장하듯이 프로필을 장식해봐요!',style: TextStyle(fontFamily: 'Pretendard',fontSize: 14, color: gray500),)

    ],
  );
}

Widget navigateToSetUpProfileButton(context) {
  return ElevatedButton(
    onPressed: () {
      //  Navigator.push(context,
      //    MaterialPageRoute(builder: (context) =>  SignUpScreen()));
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: primary,
      minimumSize: const Size(double.infinity, 58),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    child: const Text(
      '시작하기',
      style: TextStyle(color: Colors.white,fontSize: 18, fontFamily: 'Pretendard-Medium'),
    ),
  );
}

Widget skipToSetUpProfileButton(context) {
  return ElevatedButton(
    onPressed: () {
      //  Navigator.push(context,
      //    MaterialPageRoute(builder: (context) =>  SignUpScreen()));
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: gray50,
      minimumSize: const Size(double.infinity, 58),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    child: const Text(
      '생략하기',
      style: TextStyle(color: gray600,fontSize: 18, fontFamily: 'Pretendard-Medium'),
    ),
  );
}
}

