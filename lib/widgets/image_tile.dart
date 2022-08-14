import 'package:flutter/material.dart';

import '../data_model.dart';
import '../screen_arguments.dart';
import '../screens/full_view.dart';
import 'image_view.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    Key? key,
    required this.image,
    required this.index,
  }) : super(key: key);

  final int index;
  final Urls? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.pushNamed(context, FullView.id,
          arguments: ScreenArguments(image!.regular!))),
      child: ImageView(
        imageUrl: image!.thumb!,
      ),
    );
  }
}
