import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toktok_mobile/theme/colors.dart';

// MARK: 회원가입 힌트 텍스트
Widget signUpTextArea() {

  return const Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        '만나서 반가워요!\n휴대폰 번호로 가입해주세요',
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

// MARK: 번호 인증 화면 이동 버튼
Widget navigateToTelVerificationButton(BuildContext context, bool isKeyboardVisible, bool isTextFieldNotEmpty) {

  return Padding(
    padding: EdgeInsets.only(left: isKeyboardVisible? 0 : 16, right: isKeyboardVisible? 0 : 16),
    child: ElevatedButton(
        onPressed: () {
          print(isTextFieldNotEmpty);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isTextFieldNotEmpty ? secondary : gray100,
          minimumSize: const Size(double.infinity,58),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isKeyboardVisible ? 0 : 16),
          ),
        ),
        child: const Text(
          '인증문자 받기',
          style: TextStyle(color: gray300, fontSize: 18, fontFamily: 'Pretendard', fontWeight: FontWeight.w500),
        ),
      ),
  );
}


// MARK: 번호 인증 화면 텍스트 
Widget navigateToTelVerificationHelpText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        '휴대폰 번호가 변경되었나요?',
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w300,
          color: gray400,
        ),
      ),
      const SizedBox(width: 3),
      GestureDetector(
        child: const Text(
          '이메일로 계정찾기',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w300,
            decoration: TextDecoration.underline,
            color: gray400,
          ),
        ),
      ),
    ],
  );
}

// MARK: 번호 인증 화면 영역
Widget navigateToTelVerificationArea(BuildContext context, bool isKeyboardVisible, bool isTextFieldNotEmpty) {
  return Column(
    children: [
      navigateToTelVerificationHelpText(),
      const SizedBox(height: 20),
      navigateToTelVerificationButton(context, isKeyboardVisible, isTextFieldNotEmpty),  
      SizedBox(height: isKeyboardVisible? 0 : 20),  
    ],
  );
}

