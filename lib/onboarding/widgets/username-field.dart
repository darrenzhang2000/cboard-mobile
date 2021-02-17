import 'package:flutter/material.dart';

class UsernameField extends StatefulWidget {
  final TextEditingController controller;
  const UsernameField({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  _UsernameFieldState createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Email',
          suffixIcon:
              RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(widget.controller.text)
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : null),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty)
          return 'Please enter a valid email';
        else
          return null;
      },
    );
  }

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
