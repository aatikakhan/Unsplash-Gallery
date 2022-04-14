import 'package:flutter/material.dart';

class AdvanceSearch extends StatefulWidget {
  const AdvanceSearch({Key? key}) : super(key: key);

  @override
  State<AdvanceSearch> createState() => _AdvanceSearchState();
}

class _AdvanceSearchState extends State<AdvanceSearch> {
  bool _relevanceCheck = true;
  bool _newestCheck = false;
  String relevanceValue = 'relevence';

  bool _anyColorCheck = true;
  bool _blacAndWhiteCheck = false;
  bool _selectedToneCheck = false;
  List<Colors> colorslist = [];
  bool _landscapeCheck = true;
  bool _portraitCheck = false;
  bool _squareCheck = false;
  String sortbyValue = '';
  String colorValue = '';
  String orientationValue = '';

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
              Row(
                children: [
                  _relevanceCheck
                      ? const SizedBox(width: 16, child: Icon(Icons.check))
                      : const SizedBox(width: 16),
                  const SizedBox(width: 16),
                  GestureDetector(
                    child: const Text('Relevance'),
                    onTap: () {
                      setState(() {
                        _relevanceCheck = true;
                        _newestCheck = false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _newestCheck
                      ? const SizedBox(width: 16, child: Icon(Icons.check))
                      : const SizedBox(width: 16),
                  const SizedBox(width: 16),
                  GestureDetector(
                    child: const Text('Newest'),
                    onTap: () {
                      setState(() {
                        _relevanceCheck = false;
                        _newestCheck = true;
                      });
                    },
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Divider(thickness: 1),
              ),
              const Text('Color : '),
              const SizedBox(height: 12),
              Row(
                children: [
                  _anyColorCheck
                      ? const SizedBox(width: 16, child: Icon(Icons.check))
                      : const SizedBox(width: 16),
                  const SizedBox(width: 16),
                  GestureDetector(
                    child: const Text('Any Color'),
                    onTap: () {
                      setState(() {
                        _anyColorCheck = true;
                        _blacAndWhiteCheck = false;
                        _selectedToneCheck = false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _blacAndWhiteCheck
                      ? const SizedBox(width: 16, child: Icon(Icons.check))
                      : const SizedBox(width: 16),
                  const SizedBox(width: 16),
                  GestureDetector(
                    child: const Text('Black and White'),
                    onTap: () {
                      setState(() {
                        _anyColorCheck = false;
                        _blacAndWhiteCheck = true;
                        _selectedToneCheck = false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const SizedBox(width: 32),
                  const Text('Tones:'),
                  const SizedBox(width: 16),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width * .5,
                    child: GridView.builder(physics: const NeverScrollableScrollPhysics(),
                        itemCount: 12,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedToneCheck = true;
                                  _anyColorCheck = false;
                                  _blacAndWhiteCheck = false;
                                  // get colorId
                                });
                              },
                              child: Container(),
                            ),
                          );
                        }),
                  )
                ],
              ),
              const SizedBox(height: 12),
              const Divider(thickness: 1),
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
                onPressed: () {},
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
