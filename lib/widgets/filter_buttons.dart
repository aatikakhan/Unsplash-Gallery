import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const FilterButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          side: const BorderSide(width: 2.0, color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        onPressed: onTap,
        child: Center(
          child: Text(
            text.toString(),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
