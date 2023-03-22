import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x004242),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Coding Cafe',
              style: TextStyle(
                color: Color(0x7D9E9E),
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Cats and Dogs detector App',
              style: TextStyle(
                color: Color(0x7D9E9E),
                fontWeight: FontWeight.w500,
                fontSize: 30
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}