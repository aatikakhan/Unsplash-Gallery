import 'package:flutter/material.dart';

import 'data_model.dart';
import 'screens/full_view.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.image,
    required this.index,
  }) : super(key: key);

  final int index;
  final Urls? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return FullView(
                  image: image!.regular!,
                );
              },
            ),
          )),
      child: imageView(image!.thumb!),
    );
  }
}

Widget imageView(String image) {
  return Center(
    child: Image.network(
      image,
      fit: BoxFit.fill,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!.toInt()
              : 0,
        );
      },
    ),
  );
}
