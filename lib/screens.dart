import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'data_model.dart';
import 'data_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DataModel>? entries;
  @override
  void initState() {
    Provider.of<DataProvider>(context, listen: false).getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, DataProvider dataProvider, child) {
        entries = dataProvider.data;

        return Scaffold(
          body: entries != null
              ? CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      floating: true,
                      pinned: true,
                      snap: false,
                      centerTitle: false,
                      title: Text(
                        widget.title,
                        style: const TextStyle(color: Colors.black),
                      ),
                      bottom: AppBar(
                        backgroundColor: Colors.white,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .76,
                              height: 40,
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: 'Search e.g. "fruits"',
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              onPressed: () {
                                Provider.of<DataProvider>(context).getData();
                              },
                              icon:
                                  const Icon(Icons.search, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        SafeArea(
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: GridView.builder(itemCount: entries!.length,
                                itemBuilder: (context, index) => Tile(
                                    index: index,
                                    image: entries![index].urls!.raw,
                                  ),
                                gridDelegate: SliverWovenGridDelegate.count(
                                  crossAxisCount: 2,
                                  pattern: [
                                    const WovenGridTile(1),
                                    const WovenGridTile(
                                    12/16,
                                      crossAxisRatio: 1,
                                    ),
                                  ],
                                ),
                              )),
                        )
                      ]),
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(dataProvider.status.toString()),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.image,
    required this.index,
    this.extent,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border.all(),
          boxShadow: const [
            BoxShadow(
                blurRadius: 10, color: Colors.white70, offset: Offset(1, 3))
          ]),
      child:Image.network(
              image!,
              fit: BoxFit.fill,
            ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.white,
        )
      ],
    );
  }
}
