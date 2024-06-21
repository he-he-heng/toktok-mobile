import 'package:flutter/material.dart';
import 'package:toktok_mobile/features/authentication/application/signup/widgets/signup_screen_widget.dart';
import 'package:toktok_mobile/features/utilities/custom_backbutton.dart';
import 'package:toktok_mobile/features/utilities/outlined_textfield.dart';
import 'package:toktok_mobile/theme/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  void _updatePhoneNumberFocus(bool isFocused) {
    bool _isPhoneNumberFocused = false;
    setState(() {
      _isPhoneNumberFocused = isFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const CustomBackButton(assetName: 'assets/images/backButton.png'),
              const SizedBox(height: 30),
              signUpTextArea(),
              const SizedBox(height: 25),
              InputPhoneNumber(
                onFocusChange: _updatePhoneNumberFocus,
              ),
              const Spacer(),
              navigateToTelVerificationArea(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class InputPhoneNumber extends StatefulWidget {
  final ValueChanged<bool> onFocusChange;

  const InputPhoneNumber({
    super.key,
    required this.onFocusChange,
  });

  @override
  State<InputPhoneNumber>createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends State<InputPhoneNumber> {
  late FocusNode _focusNode;
  bool _isFocused = false;

 @override
void initState() {
  super.initState();
  _focusNode = FocusNode();
  _focusNode.addListener(() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
    widget.onFocusChange(_focusNode.hasFocus);
  });
}


  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedTextField(
          setText: '휴대폰 번호 (-없이 숫자만 입력)',
          inputType: TextInputType.phone,
          focusNode: _focusNode,
          borderColor: _isFocused ? secondary : gray300, 
          setIntroText: '휴대폰 번호',
        ),
      ],
    );
  }
}

