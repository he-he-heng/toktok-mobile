import 'package:flutter/material.dart';
import 'package:toktok_mobile/theme/colors.dart';

class OutlinedTextField extends StatefulWidget {
  final String setText;
  final String setIntroText;
  final TextInputType? inputType;

  const OutlinedTextField({
    Key? key,
    required this.setText,
    this.inputType, required FocusNode focusNode, required Color borderColor, 
    required this.setIntroText,
  }) : super(key: key);

  @override
  _OutlinedTextFieldState createState() => _OutlinedTextFieldState();
}

class _OutlinedTextFieldState extends State<OutlinedTextField> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = _isFocused ? secondary : gray400;

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 3),
            Text(
              '휴대폰 번호',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                color: borderColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: borderColor),
          ),
          child: TextField(
            focusNode: _focusNode,
            keyboardType: widget.inputType,
            decoration: InputDecoration(
              hintText: widget.setText,
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
