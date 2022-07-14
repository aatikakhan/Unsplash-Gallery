import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_provider.dart';

class AdvanceSearch extends StatefulWidget {
  const AdvanceSearch({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text('Sort by : '),
              const SizedBox(height: 12),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
                child: Row(
                  children: [
                    _relevanceCheck
                        ? const SizedBox(width: 16, child: Icon(Icons.check))
                        : const SizedBox(width: 16),
                    const SizedBox(width: 16),
                    GestureDetector(
                      child: const Text('Relevance'),
                      onTap: () {
                        sortbyValue = 'relevant';
                        setState(() {
                          _relevanceCheck = true;
                          _newestCheck = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
                child: Row(
                  children: [
                    _newestCheck
                        ? const SizedBox(width: 16, child: Icon(Icons.check))
                        : const SizedBox(width: 16),
                    const SizedBox(width: 16),
                    GestureDetector(
                      child: const Text('Newest'),
                      onTap: () {
                        sortbyValue = 'latest';
                        setState(() {
                          _relevanceCheck = false;
                          _newestCheck = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Divider(thickness: 1),
              ),
              const Text('Color : '),
              const SizedBox(height: 12),
              SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                  child: Row(
                    children: [
                      _anyColorCheck
                          ? const SizedBox(width: 16, child: Icon(Icons.check))
                          : const SizedBox(width: 16),
                      const SizedBox(width: 16),
                      GestureDetector(
                        child: const Text('Any Color'),
                        onTap: () {
                          colorValue = '';
                          setState(() {
                            _anyColorCheck = true;
                            _blacAndWhiteCheck = false;
                            _selectedToneCheck = false;
                          });
                        },
                      ),
                    ],
                  )),
              const SizedBox(height: 12),
              SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                  child: Row(
                    children: [
                      _blacAndWhiteCheck
                          ? const SizedBox(width: 16, child: Icon(Icons.check))
                          : const SizedBox(width: 16),
                      const SizedBox(width: 16),
                      GestureDetector(
                        child: const Text('Black and White'),
                        onTap: () {
                          colorValue = 'black_and_white';
                          setState(() {
                            _anyColorCheck = false;
                            _blacAndWhiteCheck = true;
                            _selectedToneCheck = false;
                          });
                        },
                      ),
                    ],
                  )),
              const SizedBox(height: 12),
              const SizedBox(width: 32),
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
              GestureDetector(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _landscapeCheck
                        ? const SizedBox(width: 16, child: Icon(Icons.check))
                        : const SizedBox(width: 16),
                    const SizedBox(width: 12),
                    const Icon(Icons.crop_landscape_outlined),
                    const SizedBox(width: 12),
                    const Text('Landscape'),
                  ],
                ),
                onTap: () {
                  orientationValue = 'landscape';
                  setState(() {
                    _portraitCheck = false;
                    _landscapeCheck = true;
                    _squareCheck = false;
                  });
                },
              ),
              GestureDetector(
                child: Row(
                  children: [
                    _portraitCheck
                        ? const SizedBox(width: 16, child: Icon(Icons.check))
                        : const SizedBox(width: 16),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.crop_portrait),
                    ),
                    const Text('  Portrait'),
                  ],
                ),
                onTap: () {
                  orientationValue = 'portrait';
                  setState(() {
                    _portraitCheck = true;
                    _landscapeCheck = false;
                    _squareCheck = false;
                  });
                },
              ),
              GestureDetector(
                child: Row(children: [
                  _squareCheck
                      ? const SizedBox(width: 16, child: Icon(Icons.check))
                      : const SizedBox(width: 16),
                  const SizedBox(width: 12),
                  const Icon(Icons.crop_square),
                  const SizedBox(width: 12),
                  const Text('Square'),
                ]),
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
      bottomNavigationBar: SizedBox(
        height: kToolbarHeight,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(width: 2.0, color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Text(
                    ' Cancel ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(width: 2.0, color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                onPressed: () {
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
                },
                child: const Center(
                  child: Text(
                    ' Clear ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
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
