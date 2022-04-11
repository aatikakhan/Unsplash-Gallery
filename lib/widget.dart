import 'package:flutter/material.dart';

import 'data_model.dart';
import 'screens.dart';

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
