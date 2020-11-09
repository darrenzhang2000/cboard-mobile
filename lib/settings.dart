import 'package:flutter/material.dart';

var sectionSubHeaders = [
  ['Language', 'Speech'],
  ['Export', 'Import', 'Display', 'Scanning', 'Navigation'],
  ['User Help', 'About Cboard', 'Donate', 'Feedback']
];

var sectionHeaders = ['LANGUAGE', 'SYSTEM', 'HELP'];

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, 45.0),
        child: AppBar(title: Text('Settings'), centerTitle: true, backgroundColor: Colors.deepPurple[900])
        ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProfileSection(), // Section with avatar image, username, and name
            SizedBox(height: 10), // Padding
            Section(header: sectionHeaders[0], subHeaders: sectionSubHeaders[0]), // Languages section
            SizedBox(height: 10), // Padding
            Section(header: sectionHeaders[1], subHeaders: sectionSubHeaders[1]), // System section
            SizedBox(height: 10), // Padding
            Section(header: sectionHeaders[2], subHeaders: sectionSubHeaders[2])  // Help section
          ]
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}

class Section extends StatelessWidget {

  final String header;
  final List subHeaders;

  Section({this.header, this.subHeaders});

  Widget _buildList(list) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 48),
      shrinkWrap: true, // Prevent nested scrolling
      physics: NeverScrollableScrollPhysics(),  // Prevent nested scrolling
      itemCount: list.length * 2 - 1,
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider(thickness: 1,);
        final index = item ~/ 2;
        return _buildRow(list[index]);
      }
    );
  }

  Widget _buildRow(String item) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
      child: Text(item)
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    Widget list = _buildList(this.subHeaders);
    return SizedBox(
      width: screenWidth,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: Text(this.header, style: TextStyle(fontSize: 12))
              ),
              list
              ]
          )
      )
    );
  }
}

class ProfileSection extends StatelessWidget {
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      child: Card(
        elevation: 5,
        child: Row (
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: CircleAvatar(backgroundColor: Colors.grey, minRadius: 50,)
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Username', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 20),
                Text('Name')
              ]
            )
          ]
        )
      )
    );
  }
}
