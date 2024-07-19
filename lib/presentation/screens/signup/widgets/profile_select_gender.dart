import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toktok_mobile/presentation/widgets/custom_backbutton.dart';
import 'package:toktok_mobile/presentation/widgets/custom_togglebutton.dart';
import 'package:toktok_mobile/theme/colors.dart';

class ProfileSelectGenderScreen extends ConsumerStatefulWidget {
  const ProfileSelectGenderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileSelectGenderScreenState();
}

class _ProfileSelectGenderScreenState
    extends ConsumerState<ProfileSelectGenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            const CustomBackButton(
              assetName: 'assets/images/backButton.png',
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: 0.2,
              borderRadius: BorderRadius.circular(4),
              color: secondary,
            ),
            const SizedBox(height: 20),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('회원님의 성별이 무엇인가요?',
                      style: TextStyle(fontSize: 24, fontFamily: 'Pretendard')),
                  const SizedBox(height: 10),
                  const Text('성별은 만남에 중요한 역할을 합니다.',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          color: gray400)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomToggleButton(leftButtonText: '여성', rightButtonText: '남성'),
            Spacer(),
            navigateToSetUpBirthDateButton(context)
          ],
        ),
      )),
    );
  }
}


Widget navigateToSetUpBirthDateButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      null;
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: secondary,
      minimumSize: const Size(double.infinity, 58),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    child: const Text(
      '다음',
      style: TextStyle(
          color: gray300,
          fontSize: 18,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w500,
      ),
    ),
  );
}
