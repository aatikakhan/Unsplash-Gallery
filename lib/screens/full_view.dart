import 'package:flutter/material.dart';

import '../screen_arguments.dart';
import '../widgets/image_view.dart';

class FullView extends StatelessWidget {
  const FullView({Key? key}) : super(key: key);

  static String id = '/fullView';

  @override
  Widget build(BuildContext context) {
    ScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/details_icon.png',
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        body: ImageView(imageUrl: args.imageUrl));
  }
}
