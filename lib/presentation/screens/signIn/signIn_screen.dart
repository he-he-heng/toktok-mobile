// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:toktok_mobile/presentation/screens/signup/widgets/signup_screen_widget.dart';
// import 'package:toktok_mobile/presentation/widgets/custom_backbutton.dart';

// class SignInScreen extends ConsumerWidget {
//   const SignInScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final loginState = watch(login);
//     final loginNotifier = context.read(login);

//     return Scaffold(
//       body: Column(
//         children: [
//               const SizedBox(height: 10),
//               const CustomBackButton(assetName: 'assets/images/backButton.png'),
//               const SizedBox(height: 30),
//               signUpTextArea(),
//               const SizedBox(height: 25),
//               InputPhoneNumber(
//                 onFocusChange: _updatePhoneNumberFocus,
//               ),
//               const Spacer(),
//               navigateToTelVerificationArea(context),
//               const SizedBox(height: 20),
//             ],
//       ),
//     );
//   }
// }