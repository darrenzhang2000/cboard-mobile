import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class User_help extends StatelessWidget {
  final controller = ScrollController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User help'),
      ),
      body: FutureBuilder(
          future: rootBundle.loadString("translation/User-help/en-US.md"),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Markdown(
                data: snapshot.data,
                onTapLink: (text, url, title) {
                  launch(url);
                },
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
