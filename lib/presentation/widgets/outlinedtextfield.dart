import 'package:flutter/material.dart';
import 'package:toktok_mobile/theme/colors.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextInputType? inputType;
  final TextEditingController controller;

  const CustomTextField({
    super.key, 
    required this.labelText,
    required this.hintText,
    required this.controller, 
    this.inputType, required onChanged, required String? Function(dynamic value) validator,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            color: _hasFocus ? secondary : gray400,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            keyboardType: widget.inputType,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: gray400),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: gray400),
                borderRadius: BorderRadius.circular(16.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: secondary),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}



