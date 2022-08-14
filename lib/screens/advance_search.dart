import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ungallery/widgets/filter_buttons.dart';
import 'package:ungallery/widgets/orientation.dart';
import 'package:ungallery/widgets/select_colour.dart';
import 'package:ungallery/widgets/sortby.dart';

import '../data_provider.dart';

class AdvanceSearch extends StatefulWidget {
  const AdvanceSearch({Key? key}) : super(key: key);
  static String id = '/advanceSearch';

  @override
  State<AdvanceSearch> createState() => _AdvanceSearchState();
}

class _AdvanceSearchState extends State<AdvanceSearch> {
  int perPageValue = 10;
  bool _relevanceCheck = false;
  bool _newestCheck = false;
  String relevanceValue = 'relevence';
  bool _anyColorCheck = false;
  bool _blacAndWhiteCheck = false;
  bool _selectedToneCheck = false;
  bool _landscapeCheck = false;
  bool _portraitCheck = false;
  bool _squareCheck = false;
  String sortbyValue = '';
  String colorValue = '';
  String orientationValue = '';
  int indextone = 0;
  List<Color> materialColorsList = [
    Colors.black,
    Colors.white,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.purple,
    const Color(0xFFFF00FF),
    Colors.green,
    Colors.teal,
    Colors.blue
  ];
  List<String> colourNameList = [
    'black',
    'white',
    'yellow',
    'orange',
    'red',
    'purple',
    'magenta',
    'green',
    'teal',
    'blue'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: const Text('Filters', style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text('Sort by : '),
                const SizedBox(height: 12),
                Sortby(
                    text: 'Newest'.toString(),
                    onTap: () {
                      sortbyValue = 'relevant';
                      setState(() {
                        _relevanceCheck = true;
                        _newestCheck = false;
                      });
                    },
                    check: _relevanceCheck),
                const SizedBox(height: 12),
                Sortby(
                    text: 'Relevant'.toString(),
                    onTap: () {
                      sortbyValue = 'latest';
                      setState(() {
                        _relevanceCheck = false;
                        _newestCheck = true;
                      });
                    },
                    check: _newestCheck),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Divider(thickness: 1),
                ),
                const Text('Color : '),
                const SizedBox(height: 12),
                SelectColour(
                    text: 'Any Color',
                    onTap: () {
                      colorValue = '';
                      setState(() {
                        _anyColorCheck = true;
                        _blacAndWhiteCheck = false;
                        _selectedToneCheck = false;
                      });
                    },
                    check: _anyColorCheck),
                const SizedBox(height: 12),
                SelectColour(
                    text: 'Black and White',
                    onTap: () {
                      colorValue = 'black_and_white';
                      setState(() {
                        _anyColorCheck = false;
                        _blacAndWhiteCheck = true;
                        _selectedToneCheck = false;
                      });
                    },
                    check: _blacAndWhiteCheck),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    SizedBox(width: 32),
                    Text('Tones:'),
                  ],
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .5,
                            child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                ),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: GestureDetector(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: materialColorsList[index],
                                              shape: BoxShape.circle,
                                              border: indextone == index
                                                  ? Border.all(
                                                      color: Colors.grey,
                                                      width: 4)
                                                  : Border.all(
                                                      color: Colors.white,
                                                      width: 4))),
                                      onTap: () {
                                        setState(() {
                                          indextone = index;
                                          _selectedToneCheck = true;
                                          _anyColorCheck = false;
                                          _blacAndWhiteCheck = false;
                                          colorValue =
                                              colourNameList[index].toString();
                                        });
                                      },
                                    ),
                                  );
                                }),
                          )
                        ],
                      )),
                ),
                const Divider(thickness: 1),
                const SizedBox(height: 12),
                const Text('Orientation :'),
                const SizedBox(height: 12),
                OrientationWidget(
                  text: 'Landscape',
                  icon: const Icon(Icons.crop_landscape_outlined),
                  check: _landscapeCheck,
                  onTap: () {
                    orientationValue = 'landscape';
                    setState(() {
                      _portraitCheck = false;
                      _landscapeCheck = true;
                      _squareCheck = false;
                    });
                  },
                ),
                const SizedBox(height: 12),
                OrientationWidget(
                  text: 'Portait',
                  icon: const Icon(Icons.crop_portrait),
                  check: _portraitCheck,
                  onTap: () {
                    orientationValue = 'portrait';
                    setState(() {
                      _portraitCheck = true;
                      _landscapeCheck = false;
                      _squareCheck = false;
                    });
                  },
                ),
                const SizedBox(height: 12),
                OrientationWidget(
                  text: 'Square',
                  icon: const Icon(Icons.crop_square),
                  check: _squareCheck,
                  onTap: () {
                    orientationValue = 'squarish';
                    setState(() {
                      _portraitCheck = false;
                      _landscapeCheck = false;
                      _squareCheck = true;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: kToolbarHeight,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilterButton(
                text: ' Cancel '.toString(),
                onTap: () {
                  Navigator.pop(context);
                }),
            FilterButton(
                text: ' Clear ',
                onTap: () {
                  setState(() {
                    // make everything false
                    _relevanceCheck = false;
                    _newestCheck = false;
                    relevanceValue = '';
                    _anyColorCheck = false;
                    _blacAndWhiteCheck = false;
                    _selectedToneCheck = false;
                    _landscapeCheck = false;
                    _portraitCheck = false;
                    _squareCheck = false;

                    // clear values
                    sortbyValue = '';
                    colorValue = '';
                    orientationValue = '';
                  });
                }),
            const SizedBox(
              height: 40,
              width: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                onPressed: () {
                  Provider.of<DataProvider>(context, listen: false).getData(
                      sortbyValue,
                      colorValue,
                      orientationValue,
                      perPageValue.toString(),
                      type: DataType.getData);
                  Provider.of<DataProvider>(context, listen: false).colorValue =
                      colorValue;
                  Provider.of<DataProvider>(context, listen: false)
                      .orderbyValue = sortbyValue;
                  Provider.of<DataProvider>(context, listen: false)
                      .orientationValue = orientationValue;
                  Provider.of<DataProvider>(context, listen: false).itemCount =
                      perPageValue.toString();
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Text(
                    ' Search ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
