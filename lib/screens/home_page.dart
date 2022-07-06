import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:provider/provider.dart';

import '../data_model.dart';
import '../data_provider.dart';
import '../widget.dart';
import 'advance_search.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DataModel>? entries;
  TextEditingController textEditingController = TextEditingController();
  int perPageValue = 10;
  final ScrollController _controller = ScrollController();
  String orderby = '';
  String color = '';
  String orientation = '';
  String itemCount = '';

  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false)
        .getData('', '', '', itemCount);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        perPageValue = perPageValue + 10;
        itemCount = perPageValue.toString();
        Provider.of<DataProvider>(context, listen: false)
            .getMoreData(itemCount);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, DataProvider dataProvider, child) {
        entries = dataProvider.data;
        return Scaffold(
          body: entries != null
              ? SafeArea(
                  child: CustomScrollView(controller: _controller, slivers: <
                      Widget>[
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
                        toolbarHeight: 96,
                        backgroundColor: Colors.white,
                        title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .77,
                                    child: TextField(
                                      maxLines: 1,
                                      maxLength: 15,
                                      showCursor: true,
                                      controller: textEditingController,
                                      decoration: const InputDecoration(
                                        counter: Offstage(),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
                                            borderSide:
                                                BorderSide(color: Colors.blue)),
                                        contentPadding: EdgeInsets.all(8),
                                        hintText: 'Search e.g. "star wars"',
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      SystemChannels.textInput
                                          .invokeMethod('TextInput.hide');
                                      Provider.of<DataProvider>(context,
                                                  listen: false)
                                              .searchQuery =
                                          textEditingController.text;

                                      Provider.of<DataProvider>(context,
                                              listen: false)
                                          .getData(orderby, color, orientation,
                                              itemCount);
                                    },
                                    icon: const Icon(Icons.search,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              textEditingController.text.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          textEditingController.text.toString(),
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        GestureDetector(
                                          child: const Icon(
                                            Icons.filter_list,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) {
                                                return const AdvanceSearch();
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : const SizedBox()
                            ]),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          entries!.isNotEmpty
                              ? SizedBox(
                                  child: MasonryGrid(
                                      column: 2,
                                      children: List.generate(
                                          entries!.length,
                                          (i) => Tile(
                                                image: entries![i].urls!,
                                                index: i,
                                              ))),
                                )
                              : SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .7,
                                  child: const Center(
                                    child: Text(
                                      'No results found.',
                                    ),
                                  )),
                        ],
                      ),
                    ),
                  ]),
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
