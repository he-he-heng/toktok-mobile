import 'package:flutter/material.dart';
import 'package:toktok_mobile/theme/colors.dart';

class CustomToggleButton extends StatefulWidget {
  final String leftButtonText;
  final String rightButtonText;

  const CustomToggleButton({
    Key? key,
    required this.leftButtonText,
    required this.rightButtonText,
  }) : super(key: key);

  @override
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool isLeftSelected = true;

  void _toggleSelection(bool isLeft) {
    setState(() {
      isLeftSelected = isLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => _toggleSelection(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: isLeftSelected ? secondary : gray100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            textStyle: TextStyle(fontSize: 18),
            minimumSize: Size(160, 60), // Minimum size of the button
          ),
          child: Text(widget.leftButtonText, style: TextStyle(color: isLeftSelected ? Colors.white : Colors.black ,fontSize: 20),),
        ),
        SizedBox(width: 20), // Space between buttons
        ElevatedButton(
          onPressed: () => _toggleSelection(false),
          style: ElevatedButton.styleFrom(
            backgroundColor: isLeftSelected ? gray100 : secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            textStyle: TextStyle(fontSize: 18),
            minimumSize: Size(160, 60), // Minimum size of the button
          ),
          child: Text(widget.rightButtonText,style: TextStyle(color: isLeftSelected ? Colors.black : Colors.white,fontSize: 20),),
        ),
      ],
    );
  }
}
