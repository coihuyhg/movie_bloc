import 'package:flutter/material.dart';

class Shuffle extends StatelessWidget {
  const Shuffle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.greenAccent,
      child: Center(
        child: Text(
          'Shuffle',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
