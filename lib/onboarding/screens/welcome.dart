import 'package:cboard_mobile/onboarding/screens/log-in.dart';
import 'package:cboard_mobile/onboarding/screens/sign-up--main.dart';
import 'package:cboard_mobile/onboarding/screens/sign-up--skip.dart';
import 'package:cboard_mobile/onboarding/widgets/header.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key key}) : super(key: key);
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Welcome'),
        appBar: AppBar(),
        widgets: [
          TextButton(
            child: Text('SKIP'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              textStyle: TextStyle(fontWeight: FontWeight.w400),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpSkip()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Header(),
            margin: EdgeInsets.only(bottom: 50),
          ),
          Container(
            child: Placeholder(
              fallbackHeight: 60,
            ),
            margin: EdgeInsets.only(bottom: 20),
          ),
          Placeholder(
            fallbackHeight: 60,
          ),
          Expanded(
            child: ButtonBar(
              children: [
                FlatButton(
                  child: Text('LOG IN'),
                  textColor: paua,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: paua)),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },
                ),
                FlatButton(
                  child: Text('SIGN UP'),
                  color: paua,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpMain()),
                    );
                  },
                ),
              ],
              alignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ],
      ),
    );
  }
}