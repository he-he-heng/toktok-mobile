import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toktok_mobile/presentation/widgets/outlinedtextfield.dart';
import 'package:toktok_mobile/theme/colors.dart';

// class InputPhoneNumber extends ConsumerStatefulWidget {
//   final ValueChanged<bool> onFocusChange;

//   const InputPhoneNumber({
//     super.key,
//     required this.onFocusChange,
//   });

//   @override
//   ConsumerState<InputPhoneNumber> createState() => _InputPhoneNumberState();
// }

// class _InputPhoneNumberState extends ConsumerState<InputPhoneNumber> {
//   int minutes = 5;
//   int seconds = 0;
//   bool isRunning = true;
//   final TextEditingController _inputEmailController = TextEditingController();
//   final TextEditingController _inputCertificationNumberController = TextEditingController();

// void startTimer() {
//     setState(() {
//       isRunning = true;
//       int totalTimeInSeconds = minutes * 60 + seconds;
//       Timer.periodic(Duration(seconds: 1), (timer) {
//         setState(() {
//           if (totalTimeInSeconds < 1) {
//             timer.cancel();
//             isRunning = false;
//           } else {
//             totalTimeInSeconds--;
//             minutes = totalTimeInSeconds ~/ 60;
//             seconds = totalTimeInSeconds % 60;
//           }
//         });
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool inputCertificationNumberTextField = true;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomTextField(
//           hintText: '이메일을 입력해주세요',
//           inputType: TextInputType.phone,
//           labelText: '이메일',
//           controller: _inputEmailController,
//         ),
//         const SizedBox(height: 20),
//         Visibility(
//           visible: inputCertificationNumberTextField,
//           child: Stack(
//             children: [
//               CustomTextField(
//               hintText: '인증번호를 입력해주세요',
//               inputType: TextInputType.phone,
//               labelText: '인증번호',
//               controller: _inputCertificationNumberController,
//               ),
//               Text('${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}'),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
