import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ungallery/data_provider.dart';
import 'package:ungallery/screens/advance_search.dart';
import 'package:ungallery/screens/full_view.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>(
      create: (_) => DataProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        initialRoute: MyHomePage.id,
        routes: {
          MyHomePage.id: (context) =>
              const MyHomePage(title: 'Unsplash Gallery'),
          AdvanceSearch.id: (context) => const AdvanceSearch(),
          FullView.id: (context) => const FullView(),
        },
      ),
    );
  }
}
