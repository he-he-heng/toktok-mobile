import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toktok_mobile/presentation/screens/onboarding/onboarding_screen.dart.dart';
import 'package:toktok_mobile/presentation/screens/signup/account_creation_complete_screen.dart';
import 'package:toktok_mobile/presentation/screens/signup/widgets/profile_select_gender.dart';

void main() async {
  // await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(
    child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileSelectGenderScreen()
    );
  }
}
