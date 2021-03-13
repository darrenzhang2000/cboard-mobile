import 'package:cboard_mobile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cboard_mobile/data/data.dart';

class UnlockedHomeScreen extends StatefulWidget {
  const UnlockedHomeScreen({Key key}) : super(key: key);
  @override
  _UnlockedHomeScreenState createState() => _UnlockedHomeScreenState();
}

class _UnlockedHomeScreenState extends State<UnlockedHomeScreen> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 90),
        child: Container(
          height: 90,
          margin: EdgeInsets.only(
              top: 25.0), // avoid overlapping with phone's top display stuff
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //SentenceBar(), // Sentence Creation Section
              UnlockedMainBar(
                  scrollOffset: _scrollOffset), // Main Navigation Bar
              Container(
                  height: 20,
                  padding: EdgeInsets.fromLTRB(12, 6, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Board Name>Folder',
                        style: TextStyle(
                          color: Color(0xff23036A),
                          fontSize: 14.0,
                          fontFamily: "Robotto",
                        ),
                      ),
                      FlatButton(
                        onPressed: () => {},
                        child: Row(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Text(
                              'SELECT',
                              style: TextStyle(
                                  color: Color(0xff23036A),
                                  fontSize: 14.0,
                                  fontFamily: "Proxima Nova",
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      body: Container(
        child: GridView.count(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 7.0,
          ),
          crossAxisCount: 3,
          children: example.map((item) {
            return Tiles(tile: item);
          }).toList(),
        ),
      ),
    );
  }
}