import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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

  @override
  void initState() {
    Provider.of<DataProvider>(context, listen: false).getData('', '', '', perPageValue.toString());
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
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
                  child: CustomScrollView(slivers: <Widget>[
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        .getData('', '', '',perPageValue.toString());
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
                                child: MasonryGridView.count(
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                    itemCount: entries!.length,
                                    itemBuilder: (context, index) {
                                      return Tile(
                                        image: entries![index].urls!,
                                        index: index,
                                      );
                                    }),
                              )
                            : SizedBox(
                                height: MediaQuery.of(context).size.height * .7,
                                child: const Center(
                                  child: Text(
                                    'No results found.',
                                  ),
                                )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side: const BorderSide(
                                  width: 2.0, color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            onPressed: ()async { 
                              perPageValue = perPageValue + 10;
                              await Provider.of<DataProvider>(context, listen: false)
                                  .getData('', '', '' , perPageValue.toString());
                             entries= Provider.of<DataProvider>(context, listen: false)
                                  .data;
                            
                            },
                            child: const Center(
                              child: Text(
                                ' Load more.. ',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]))
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
