import 'package:cboard_mobile/onboarding/screens/select-voice.dart';
import 'package:cboard_mobile/onboarding/widgets/TTS-dialog.dart';
import 'package:cboard_mobile/onboarding/widgets/header-user.dart';
import 'package:cboard_mobile/shared/app-bar.dart';
import 'package:cboard_mobile/shared/button.dart';
import 'package:cboard_mobile/stylesheets/constants.dart';
import 'package:cboard_mobile/stylesheets/typography.dart' as CustomTypography;
import 'package:flutter/material.dart';

class SignUpTTS extends StatefulWidget {
  final String locale;
  const SignUpTTS({Key key, this.locale}) : super(key: key);
  @override
  _SignUpTTSState createState() => _SignUpTTSState();
}

class _SignUpTTSState extends State<SignUpTTS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Install TTS'),
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          Container(
            child: UserHeader(shouldSetPhoto: false, locale: widget.locale),
            margin: EdgeInsets.only(bottom: 3),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'STEP 1',
                    style: CustomTypography.Typography.label(),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: CustomTypography.Typography.description(),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            color: white,
            margin: EdgeInsets.only(bottom: 3),
            padding: EdgeInsets.all(15),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'STEP 2',
                    style: CustomTypography.Typography.label(),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: CustomTypography.Typography.description(),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            color: white,
            margin: EdgeInsets.only(bottom: 3),
            padding: EdgeInsets.all(15),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Button(
                    label: Text('DONE'),
                    padding: 40,
                    onPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildTTSDialog(context),
                      );
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTTSDialog(BuildContext context) {
  return TTSDialog();
}