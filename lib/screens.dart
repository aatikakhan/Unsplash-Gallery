import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'data_model.dart';
import 'data_provider.dart';
import 'widget.dart';

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
              ? SafeArea(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        floating: true,
                        backgroundColor: Colors.white,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .77,
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
                              IconButton(
                                onPressed: () {
                                  Provider.of<DataProvider>(context).getData();
                                },
                                icon: const Icon(Icons.search,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          SizedBox(
                              child: MasonryGridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            itemCount: entries!.length,
                            itemBuilder: (context, index) {
                              return Tile(
                                image: entries![index].urls!,
                                index: index,
                              );
                            },
                          )),
                        ]),
                      ),
                    ],
                  ),
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

class FullView extends StatelessWidget {
  final String image;
  const FullView({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Center(child: imageView(image)),
    );
  }
}
