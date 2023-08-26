import 'package:flutter/material.dart';
import 'package:riilfit/src/presentation/resources/res.dart';

class membershipCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stacked Circle Avatars'),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
