import 'package:flutter/material.dart';

class SignedOutPortal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const Text("Welcome to Grep My Cloud!"),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/googleSignIn'),
          child: const Text('Google Sign In'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/apiSignIn'),
          child: const Text('GMC API Sign In'),
        ),
      ],
    );
  }
}
