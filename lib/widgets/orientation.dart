import 'package:flutter/material.dart';

class OrientationWidget extends StatelessWidget {
  final bool check;
  final VoidCallback onTap;
  final Icon icon;
  final String text;
  const OrientationWidget(
      {Key? key,
      required this.check,
      required this.onTap,
      required this.icon,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          check
              ? const SizedBox(width: 16, child: Icon(Icons.check))
              : const SizedBox(width: 16),
          const SizedBox(width: 12),
          icon,
          const SizedBox(width: 12),
          Text(text.toString()),
        ],
      ),
      onTap: onTap,
    );
  }
}
