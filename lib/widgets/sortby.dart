import 'package:flutter/material.dart';

class Sortby extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool check;
  const Sortby(
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
          GestureDetector(child: Text(text), onTap: onTap),
        ],
      ),
    );
  }
}
