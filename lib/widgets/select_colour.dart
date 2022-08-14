import 'package:flutter/material.dart';

class SelectColour extends StatelessWidget {
  final VoidCallback onTap;
  final bool check;
  final String text;
  const SelectColour(
      {Key? key, required this.onTap, required this.check, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .02,
      child: Row(
        children: [
          check
              ? const SizedBox(width: 16, child: Icon(Icons.check))
              : const SizedBox(width: 16),
          const SizedBox(width: 16),
          GestureDetector(child: Text(text.toString()), onTap: onTap),
        ],
      ),
    );
  }
}
