import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  final String? setText;

  const OutlinedTextField({
    super.key,
    required this. setText });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: const [
          // Here you can add input formatters to restrict input to numbers only if necessary
          // 입력 사항을 추가하여 필요한 경우에만 숫자로 입력을 제한할 수 있다
          // const 지우고 사용할것
          
          // 예시: 정규 표현식 한글 & 영어만 받기
          // FilteringTextInputFormatter(
          // RegExp('[a-z A-Z ㄱ-ㅎ|가-힣|·|：]'),
          // allow: true,
          // )
        ],
        decoration: InputDecoration(
          hintText: setText,
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}