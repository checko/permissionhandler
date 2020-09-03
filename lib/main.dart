import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FF ',
      home: Scaffold (
        body: Center(
          child: MaterialButton(
            color: Colors.yellow[300],
            child: Text('Request contacts permission'),
            onPressed: () {
              print('Permission has been denied');
            },
          ),
        ),
      ),
    );
  }
}
