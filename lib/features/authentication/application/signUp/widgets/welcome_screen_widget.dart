import 'package:flutter/material.dart';
import 'package:toktok_mobile/features/authentication/application/signup/signup_screen.dart';
import 'package:toktok_mobile/theme/colors.dart';


// MARK: 회원 가입 화면 이동 버튼
Widget navigateToSignUpButton(context) {
  return ElevatedButton(
    onPressed: () {
       Navigator.push(context,
         MaterialPageRoute(builder: (context) =>  SignUpScreen()));
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

// MARK: 로그인 화면 이동 버튼
Widget navigateToLoginButton(context) {
  return GestureDetector(
    onTap: () {
    },
    child: const Text(
      '로그인',
      style: TextStyle(
        color: secondary,
        fontFamily: 'PretendardMedium',
        fontSize: 14,
      ),
    ),
  );
}

// MARK: 로그인 화면 이동 텍스트
Widget navigateToLoginText() {
  return const Text(
    '이미 계정이 있나요?',
    style: TextStyle(
      color: gray400,
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w300,
      fontSize: 14,
    ),
  );
}

// MARK: 로그인 관련 하단 영역
Widget navigateToLoginArea(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      navigateToLoginText(),
      const SizedBox(width: 8),
      navigateToLoginButton(context),
    ],
  );
}

// MARK: 서비스 소개 영역
Widget introduceArea() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/images/toktok_logo.png', width: 190, height: 190),
      introduceText1(),
      introduceText2(),
    ],
  );
}

// MARK: 서비스 소개 텍스트 상단
Widget introduceText1() {
  return const Text(
    '만남을 위해 TokTok',
    style: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w500,
    ),
  );
}

// MARK: 서비스 소개 텍스트 하단
Widget introduceText2() {
  return const Text(
    '새로운 만남을 메타버스에서 찾아봐요',
    style: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: 'Pretendard',
      fontWeight: FontWeight.w500,
    ),
  );
}
