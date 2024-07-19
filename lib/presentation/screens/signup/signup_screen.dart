import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toktok_mobile/presentation/screens/signup/widgets/signup_screen_widget.dart';
import 'package:toktok_mobile/presentation/widgets/custom_backbutton.dart';
import 'package:toktok_mobile/presentation/widgets/outlinedtextfield.dart';
import 'package:toktok_mobile/theme/colors.dart';

final inputEmailTextFieldhasValue = StateProvider((ref) => false);
final inputCertificationNumberTextFieldhasValue = StateProvider((ref) => false);

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  
  bool isKeyboardVisible = false;
  bool isTextFieldNotEmpty = false;

  @override
  Widget build(BuildContext context) {
  isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
  isTextFieldNotEmpty = ref.watch(inputEmailTextFieldhasValue);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const CustomBackButton(assetName: 'assets/images/backButton.png'),
                      const SizedBox(height: 30),
                      InputPhoneNumber(
                        onFocusChange: (hasFocus) {
                          
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                navigateToTelVerificationArea(context,isKeyboardVisible, isTextFieldNotEmpty)
              ],
          ),
        ),
      ),
    );
  }
  
}


class InputPhoneNumber extends ConsumerStatefulWidget {
  final ValueChanged<bool> onFocusChange;

  const InputPhoneNumber({
    Key? key,
    required this.onFocusChange,
  }) : super(key: key);

  @override
  ConsumerState<InputPhoneNumber> createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends ConsumerState<InputPhoneNumber> {
  final TextEditingController _inputEmailController = TextEditingController();
  final TextEditingController _inputCertificationNumberController = TextEditingController();
 

  Timer? _timer;
  int _remainingTime = 300;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // 1초씩 움직이는 타이머 시작 함수
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

 void _inputCertificationNumberControllerValue() {

  }

  void _inputEmailControllerValue() {
    
  }

  @override
  void initState() {
    _inputEmailController.addListener(_inputEmailControllerValue);
    _inputCertificationNumberController.addListener(_inputCertificationNumberControllerValue);
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _inputEmailController.dispose();
    _inputCertificationNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool inputCertificationNumberTextField = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        signUpTextArea(),
        const SizedBox(height: 20),
        CustomTextField(
          hintText: '이메일을 입력해주세요',
          inputType: TextInputType.emailAddress,
          labelText: '이메일',
          controller: _inputEmailController,
          validator: (value) {
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
              return 'Please enter a valid email';
            }
            return null;
          },
          onChanged: (value) {
            if (value == '') {
              ref.read(inputEmailTextFieldhasValue.notifier).state = false;
            } else {
              ref.read(inputEmailTextFieldhasValue.notifier).state = true;
            }
          }
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: inputCertificationNumberTextField,
          child: Column(
            children: [
              Stack(
                children: [
                  CustomTextField(
                    hintText: '인증번호를 입력해주세요',
                    inputType: TextInputType.phone,
                    labelText: '인증번호',
                    controller: _inputCertificationNumberController, 
                    onChanged: null, 
                    validator: (value) {  }, 
                  ),
                  Positioned(
                    right: -85,
                    top: 45,
                    child: SizedBox(
                      height: 25,
                      width: 150,
                      child: _buildTimer(),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    '어떤 경우에도 타인에게 공유하지 마세요!',
                    style: TextStyle(fontSize: 12, fontFamily: 'Pretendard-Medium', color: gray500),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      '인증번호 다시 받기',
                      style: TextStyle(fontSize: 12, fontFamily: 'Pretendard-bold', color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimer() {
    return Text(
      '${(_remainingTime ~/ 60).toString().padLeft(2, '0')}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
      style: const TextStyle(fontSize: 16, color: warning),
    );
  }
}


// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:toktok_mobile/presentation/screens/signup/widgets/signup_screen_widget.dart';
// import 'package:toktok_mobile/presentation/widgets/custom_backbutton.dart';
// import 'package:toktok_mobile/presentation/widgets/outlinedtextfield.dart';
// import 'package:toktok_mobile/theme/colors.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         body: SafeArea(
//             child: Container(
//           padding: const EdgeInsets.only(left: 16, right: 16),
//           child: Column(
//             children: [
//               const SizedBox(height: 10),
//               const CustomBackButton(assetName: 'assets/images/backButton.png'),
//               const SizedBox(height: 30),
//               InputPhoneNumber(
//                 key: UniqueKey(), // 고유한 Key 객체 전달
//                 onFocusChange: (hasFocus) {
//                   // 포커스 변경 시 처리할 로직
//                 },
//               )
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }

// class InputPhoneNumber extends ConsumerStatefulWidget {
//   final ValueChanged<bool> onFocusChange;

//   const InputPhoneNumber({
//     Key? key, // 수정: Key 타입의 key 매개변수 추가
//     required this.onFocusChange,
//   }) : super(key: key); // 수정: super 호출 시 key 매개변수 전달

//   @override
//   ConsumerState<InputPhoneNumber> createState() => _InputPhoneNumberState();
// }

// class _InputPhoneNumberState extends ConsumerState<InputPhoneNumber> {
//   final TextEditingController _inputEmailController = TextEditingController();
//   final TextEditingController _inputCertificationNumberController =
//       TextEditingController();

//   // Timer? _timer;
//   // int _remainingTime = 300;

//   // void _startTimer() {
//   //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//   //     // 1초씩 움직이는 타이머 시작 함수
//   //     setState(() {
//   //       if (_remainingTime > 0) {
//   //         _remainingTime--;
//   //       } else {
//   //         _timer?.cancel();
//   //       }
//   //     });
//   //   });
//   // }

//   // @override
//   // void initState() {
//   //   _startTimer();
//   //   super.initState();
//   // }

//   // @override
//   // void dispose() {
//   //   _timer?.cancel();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     bool inputCertificationNumberTextField = false;
//     bool isKeyboardVisible = false;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         signUpTextArea(),
//         const SizedBox(height: 20),
//         CustomTextFormField(
//           hintText: '이메일을 입력해주세요',
//           inputType: TextInputType.emailAddress,
//           labelText: '이메일',
//           controller: _inputEmailController,
//           validator: (value) {
//             if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
//               return 'Please enter a valid email';
//             }
//             return null;
//           },
//         ),
//         const SizedBox(height: 20),
//         Visibility(
//           visible: inputCertificationNumberTextField,
//           child: Column(
//             children: [
//               // Stack(
//               //   children: [
//               //     CustomTextFormField(
//               //       hintText: '인증번호를 입력해주세요',
//               //       inputType: TextInputType.phone,
//               //       labelText: '인증번호',
//               //       controller: _inputCertificationNumberController,
//               //     ),
//               //     Positioned(
//               //       right: -85,
//               //       top: 45,
//               //       child: SizedBox(
//               //         height: 25,
//               //         width: 150,
//               //         child: _buildTimer(),
//               //       ),
//               //     ),
//               //   ],
//               // ),
//           const Row(
//           children: [
//             Text(
//               '어떤 경우에도 타인에게 공유하지 마세요!',
//               style: TextStyle(fontSize: 12,  fontFamily: 'Pretendard-Medium',color: gray500),
//             ),
//             Spacer(),
//             TextButton(onPressed: null, child: Text('인증번호 다시 받기',style: TextStyle(fontSize: 12,fontFamily: 'Pretendard-bold',color: Colors.black),)),
//                 ],
//               )
//             ],
//           ),
//         ),
//         navigateToTelVerificationArea(context,isKeyboardVisible),
//       ],
//     );
//   }

//   //  Widget _buildTimer() {
//   //   return Text(
//   //     '${(_remainingTime ~/ 60).toString().padLeft(2, '0')}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
//   //     style: const TextStyle(
//   //         fontSize: 16, color: warning),
//   //   );
//   // }
// }

