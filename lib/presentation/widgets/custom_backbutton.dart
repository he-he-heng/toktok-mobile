import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final String assetName;
  final Function()? onTap;

  const CustomBackButton({
    super.key,
    required this.assetName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap ?? () {
            Navigator.pop(context);
          },
          child: Image.asset(assetName),
        ),
      ],
    );
  }
}