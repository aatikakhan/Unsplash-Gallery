import 'package:flutter/material.dart';

import 'data_model.dart';
import 'screens/full_view.dart';

Widget imageView(String image) {
  return Image.network(
    image,
    fit: BoxFit.fill,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;

      return Container(
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.grey,
        ),
        child: Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!.toInt()
                : 0,
          ),
        ),
      );
    },
  );
}

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
                  image: image!.raw!,
                );
              },
            ),
          )),
      child: imageView(image!.thumb!),
    );
  }
}

Widget imageTile(BuildContext context, Urls? image, int index) {
  return GestureDetector(
    onTap: (() => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return FullView(
                image: image!.raw!,
              );
            },
          ),
        )),
    child: imageView(image!.thumb!),
  );
}
